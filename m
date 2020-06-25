Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022F3209BC6
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 11:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390838AbgFYJQW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 05:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390828AbgFYJQU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 05:16:20 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B131AC061573
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lDMMRXp6YNp6jZH+XEbgsI8Id4QUoHWsZlMjtrGN3Vg=; b=yk2rXj4OyZsZTh6iae+cMxeXLo
        QS+YJ54uxprQtTAkoGspUuYesdDjF/lJ/83y1R2tAPo2RlxclgC1lW3wnh8XWl0urgTleeyGKC2E2
        FqrlykxgRB/EEiAV0ZnpssnC6qG11bq1WVYoO6AFnSQoKZNHEIM6lYJOQfyr9M+HlCQtcGCnO3VWP
        6aE1wcK5jOqxjbc/ZZ8X5wTb6ebmLjdq5mLXX5wqNn/B5vJGON0/g1CdO1EwolRi0R3lwLq87aQ0c
        Amni3ihJ5AerTjz/FiD7BWz1HmAE+zCUYhTbAn0bkql1IZpqaD+q49PTQSPYwCUFan78+SvtvX/iT
        uqP09R+Q==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1joNzP-0000HN-It; Thu, 25 Jun 2020 12:16:11 +0300
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
 <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <5c0aa939-d722-5034-6328-4df5be8ee3c6@kapsi.fi>
Date:   Thu, 25 Jun 2020 12:16:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
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

On 6/25/20 2:11 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>> /* Command is an opcode gather from a GEM handle */
>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
>> /* Command is an opcode gather from a user pointer */
>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
> 
> I'm a bit dubious about whether we really need to retain the non-UPTR
> variant. The memory-copying overhead is negligible because cmdstream's
> data usually is hot in CPU's cache
> 
> IIRC, the most (if not all) of the modern DRM drivers drivers use the
> usrptr-only for the cmdstream.
> 
> At least there is no any real-world userspace example today that could
> benefit from a non-UPTR variant.
> 
> I'm suggesting to leave out the non-UPTR gather variant for now, keeping
> it in mind as a potential future extension of the submission UAPI. Any
> objections?
> 

Sure, we should be able to drop it. Downstream userspace is using it, 
but we should be able to fix that. I was thinking that we can directly 
map the user pages and point the gather to them without copying - that 
way we wouldn't need to make DMA allocations inside the driver for every 
submit. (On early Tegras we could just copy into the pushbuffer but that 
won't work for newer ones).

Mikko
