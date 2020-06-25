Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B85B209BE6
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 11:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390087AbgFYJ1R (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 05:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgFYJ1Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 05:27:16 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8614CC061573
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nR4AtFwGIMRFY4MvMa2HAwsNIEPZo5THnlgjbzn1kac=; b=Qap99a6HEDSf48mVTHOxVAUokV
        bNbna8MnS5cot8W/Gt15dx76UYvtb+tNzbIUP0N17Gg2aSj6HMWQ5V59saLUGhTFhPzx+0XIygMQt
        XSi4I29RD8Z1PLLNMdi9+Rxs/h4HNKTucbnmfgKV+/y/G5zcgzN0bHMMeLRjzOITRcOxfK3D4xJoP
        SkmQM47CkaG6GzXnyUq37Ixe0QSmP+b0FWo1fxOm1ocxaV9e4idPcVLMgZzfDbBY77au9XW7i4wMX
        0h/l0PAMS6ifeTsHXJTjj6Cg2IZUvL7t/FJNHTN6LQjLlRadPzmCaCI5+rlP7BTc+/jnEhGHXrfGY
        sTWZ3dYw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1joOA4-0004lb-J7; Thu, 25 Jun 2020 12:27:12 +0300
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
 <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
Date:   Thu, 25 Jun 2020 12:27:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
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

On 6/25/20 1:33 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>> struct drm_tegra_submit_relocation {
>>          /* [in] Index of GATHER or GATHER_UPTR command in commands. */
>>          __u32 gather_command_index;
>>
>>          /*
>>           * [in] Mapping handle (obtained through CHANNEL_MAP) of the memory
>>           *   the address of which will be patched in.
>>           */
>>          __u32 mapping_id;
>>
>>          /*
>>           * [in] Offset in the gather that will be patched.
>>           */
>>          __u64 gather_offset;
>>
>>          /*
>>           * [in] Offset in target buffer whose paddr/IOVA will be written
>>           *   to the gather.
>>           */
>>          __u64 target_offset;
>>
>>          /*
>>           * [in] Number of bits the resulting address will be logically
>>           *   shifted right before writing to gather.
>>           */
>>          __u32 shift;
>>
>>          __u32 reserved[1];
>> };
> 
> We will also need read/write direction flag here for the
> DMA-reservations set up, it will be used for the implicit BO fencing by
> the job's scheduler.
> 

Ideally on newer chips with context isolation, we no longer know what 
DMA-BUFs are being used by the job at submit time - they would just be 
pointers after being MAPped.

Do you know how other GPUs deal with DMA reservations - I expect 
separate MAP and SUBMIT steps would be pretty common? Do you have to 
pass the DMA-BUF to both steps (i.e. do IOMMU mapping during MAP, and 
manage reservations at SUBMIT)?

Mikko
