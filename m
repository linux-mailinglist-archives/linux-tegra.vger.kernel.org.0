Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B0E20AEA5
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 11:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgFZJBI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 05:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgFZJBH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 05:01:07 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9B3C08C5C1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nu6ZjKpZ+xMdFFIrl2P3rKhq0wmkDony0hAKRpmeWYQ=; b=OI3CHHJq0xACp5ptbe6LX7jw1z
        iHyyMjkiJuRBz9rfB6esgQGR39Q2uXvw1T7SDiHdO2TPWuC4PPb8SCIYjXkwRMbCISqx0+wjZrAPQ
        MMzn0m3fKcEufvj8hW4SQKqfYLzxKh6TV1A+89pFNqflDNod+B+/47h811pqOg569cAs4Xb+p8AQ4
        RNkDDuEnpY7jNwPYVcTGkeSHg0QCQFUJxFCyKzon+e2ucWeWzGNOW3Op6Gky/qm1oLOzjPjPLDobU
        lnuoCVdgsB0kDXySkuCWQxIM/k1phpCwJdx2SSki0BfFaHZ+fXGsW01ZIsop/51SOl89cT6jUGDKn
        ruw1s3ww==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jokEH-0005E1-EA; Fri, 26 Jun 2020 12:01:01 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_relocation)
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
 <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
 <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
 <eb3cac23-cd8c-732b-684c-c2d531de00a2@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <9486b5c7-7588-34fd-bb60-a3b0f252f113@kapsi.fi>
Date:   Fri, 26 Jun 2020 12:01:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <eb3cac23-cd8c-732b-684c-c2d531de00a2@gmail.com>
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

On 6/26/20 1:50 AM, Dmitry Osipenko wrote:
> 25.06.2020 12:27, Mikko Perttunen пишет:
>> On 6/25/20 1:33 AM, Dmitry Osipenko wrote:
>>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>> struct drm_tegra_submit_relocation {
>>>>           /* [in] Index of GATHER or GATHER_UPTR command in commands. */
>>>>           __u32 gather_command_index;
>>>>
>>>>           /*
>>>>            * [in] Mapping handle (obtained through CHANNEL_MAP) of the
>>>> memory
>>>>            *   the address of which will be patched in.
>>>>            */
>>>>           __u32 mapping_id;
>>>>
>>>>           /*
>>>>            * [in] Offset in the gather that will be patched.
>>>>            */
>>>>           __u64 gather_offset;
>>>>
>>>>           /*
>>>>            * [in] Offset in target buffer whose paddr/IOVA will be
>>>> written
>>>>            *   to the gather.
>>>>            */
>>>>           __u64 target_offset;
>>>>
>>>>           /*
>>>>            * [in] Number of bits the resulting address will be logically
>>>>            *   shifted right before writing to gather.
>>>>            */
>>>>           __u32 shift;
>>>>
>>>>           __u32 reserved[1];
>>>> };
>>>
>>> We will also need read/write direction flag here for the
>>> DMA-reservations set up, it will be used for the implicit BO fencing by
>>> the job's scheduler.
>>>
>>
>> Ideally on newer chips with context isolation, we no longer know what
>> DMA-BUFs are being used by the job at submit time - they would just be
>> pointers after being MAPped.
> 
> The DMA-BUFs themselves shouldn't be needed, but GEMs should.

Yes, I meant to say GEM instead of DMA-BUF.

> 
>> Do you know how other GPUs deal with DMA reservations - I expect
>> separate MAP and SUBMIT steps would be pretty common?
> 
> I can't instantly recall what other drivers do, could be worthwhile to
> take a closer look.

I'll see if I can find some similar situations in other drivers.

Mikko

> 
>> Do you have to
>> pass the DMA-BUF to both steps (i.e. do IOMMU mapping during MAP, and
>> manage reservations at SUBMIT)?
> 
> Yes, this sounds good to me if DMA-BUF part is replaced with a GEM.
> 
> Please see my other reply regarding the MAP IOCTL where I'm suggesting
> to back mapping IDs with a GEM.
>
