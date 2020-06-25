Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B75209BCE
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 11:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390066AbgFYJTr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 05:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389973AbgFYJTr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 05:19:47 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53291C061573
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qsQfkjUFuOZncerGUaB449FVVQUwgpoaY2kW/2W54j8=; b=xHPUZCcUYDVvT9NbqiVB5TRSUP
        psFQuL/KoMRzEt+NJiFlDXxEd9TJ+l2Ot+1NiPoR9zOiHjMbWraxnS2zzzkPRb6aaBmYbiPwJ3bNi
        3GvRPYBZ/+cTFoADEjRqJ3ZvfTXG/YoKJHh0WEMEEPRoyWbNLQCAk0r1XZTlMu60AodSqaRqzEAvy
        p+rm7gR8rRy5pXfdypvXeOL4w6YKQBTdr5/mIZUzAMFNNlDluTH1QV3nDWEBZVGcTlDiTqAwx47Z/
        BvoqBncN6kBgoHvNmdLA1bUwZp7e1LHKvTT4ozvDRk2hK7To5ZwcvIFXPALvHI5HVIkfHI2XNOqMN
        h1NJUWyw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1joO2q-0001XD-3i; Thu, 25 Jun 2020 12:19:44 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <3703cf87-457a-0e71-7693-5644735e438a@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <07886895-225b-6156-9217-e40cd611ccf3@kapsi.fi>
Date:   Thu, 25 Jun 2020 12:19:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3703cf87-457a-0e71-7693-5644735e438a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/25/20 2:23 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>>
>> struct drm_tegra_channel_submit {
>>          __u32 channel_id;
>>          __u32 flags;
>>
>>          /**
>>           * [in] Timeout in microseconds after which the kernel may
>>           *   consider the job to have hung and may reap it and
>>           *   fast-forward its syncpoint increments.
>>           *
>>           *   The value may be capped by the kernel.
>>           */
>>          __u32 timeout;
> 
> What about to rename this to timeout_us? For clarity.
> 
>>          __u32 num_syncpt_incrs;
>>          __u32 num_relocations;
>>          __u32 num_commands;
>>
>>          __u64 syncpt_incrs;
>>          __u64 relocations;
>>          __u64 commands;
> 
> Let's also add "_ptr" postfix to all usrptr names, again for clarity.
> 
> It's always nice to have meaningful names :)
> 

Yep, good point. I'll fix this for next revision :)

Mikko
