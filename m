Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B1620C781
	for <lists+linux-tegra@lfdr.de>; Sun, 28 Jun 2020 13:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgF1LKz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 07:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgF1LKz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 07:10:55 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48507C061794
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DHyuYMJ7JTzjNLzLPP9D5XiJHzEzCIuzeBCvhkc4kf8=; b=jI83DcJiA71faumzvwrxPBCmw1
        kkCpG9djLZ9/FAmaqbrelqkX+r4/hcsPutDn2jL+8NqZplli61zdaUCJ3epM9lTbYwdyXIBunnHOS
        rgKy9HrczcLhf/R5ghLKzEng5pzrFuouEuS0jwy6gvSoNcQq2UHnDw0rvMGHnrsAuhsswkYsD/hOT
        KZTk4MlcArPcR5kWPG3SKSFRr/MKXHCl4VCD73H7fkjhaiMd9+kw9huOYkTlec7WSCRmcNJkrMaYY
        pmr7GDxoWPrcOihneskD61jYKK4+8Q+o9jQd4bmVno+3mbU5QzmUsNftOe2ML0YWZp8mWhMLeWSZk
        lGEqwTKg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jpVCz-0007Iq-OW; Sun, 28 Jun 2020 14:10:49 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_syncpt_incr)
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
 <9ddfedff-f465-b22d-5d6f-c7ba01731455@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <3e859337-d282-7d91-32b0-070c44e67e1f@kapsi.fi>
Date:   Sun, 28 Jun 2020 14:10:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9ddfedff-f465-b22d-5d6f-c7ba01731455@gmail.com>
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

On 6/28/20 12:47 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>> struct drm_tegra_submit_syncpt_incr {
>>          /*
>>           * [in] Syncpoint FD of the syncpoint that the job will
>>           *   increment.
>>           */
>>          __s32 syncpt_fd;
>>
>>          /*
>>           * [in] Number of increments that the job will do.
>>           */
>>          __u32 num_incrs;
>>
>>          /*
>>           * [out] Value the syncpoint will have once all increments have
>>           *   executed.
>>           */
>>          __u32 fence_value;
>>
>>          __u32 reserved[1];
>> };
> 
> The job should be considered executed once the final sync point is
> incremented.
> 
> Hence, there should be only one sync point per-job for increment, why
> would you ever need more than one?
> 
> Could you please explain what this submit_syncpt_incr is about?
> 

This tells the kernel which syncpoint will be incremented and how many 
times for job tracking and verifying the user has access to that syncpoint.

A second syncpoint is used for NVENC in slice encoding mode, where the 
engine can be programmed to count encoded slices by incrementing a 
syncpoint. I'll ask around to see if I can find some more details on this.

Since the usecase is somewhat niche, we could see if we can have a 
design where it's only one syncpoint, but extensible later if needed.

Mikko
