Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E6B20A869
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 00:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407603AbgFYWuz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 18:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403838AbgFYWuz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 18:50:55 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090F7C08C5C1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 15:50:55 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y18so4091318lfh.11
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 15:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1byI84A1taS+jyeFTLN0XYFRgDGLuM/PTKl1uJXzto8=;
        b=VHzu87QK5SbM/3R0eKocVe9eak+kYN52JFUFpF/aYoPf1FpTtcnUEmdi28naOjF6/p
         cOBuMiGZMCrJGUrt5x5VSvTl8Vd/VPeg4wDYpvKsL453RXsa/IqfIPcpwMadA2tuNPnw
         6NIM2sJbD0KBVRUDBvZACd2emB/cNH4lPxHlpVJJinRChD2NzddpdxNPXElIk+0ZpQOP
         abZTXTaH2JVgGkZwfib3ms04xNO84Cvzalu8gVjprYfXP08bkVSy9KSVwvdva90c55QM
         /p1JuDhwr4BorHz7iJyGMR0bKOmDGyaFEGsY0OajO2eOf6Y/rXVdOCo6HTmv+z7YDbKj
         UXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1byI84A1taS+jyeFTLN0XYFRgDGLuM/PTKl1uJXzto8=;
        b=ZP1q2YIL7I3arNZ0dJuGAZqnDZ/RGtKbvfjuUesUlJBPRmkRuIno3FV8ZAEugvrV0Q
         79mML7SqYh0BcD3F7nUkukNLppWqCnWBIq+d7FxE1CQSYVxbx7Zg3Pu7bMUU4y/thltT
         WDiQt/9mGNOsA4eD8bN8xkg+dNy+04JqW4Cs3HOUrlfuzHeZYGr6EwN4760ylpT3AYBd
         iH6FNC7RxH4HzKVgu9Op7nS1bx48nlesnPZaZDaoj0blXpibTOzt/HKaFsZ0BAblCCm/
         Dn0FLj5VCpGTX4Kk+PzJ4OKMfPt7U50HVDe6g8w5IF4njGWks2CsSHb2LcNX4n0BHSBV
         AA6g==
X-Gm-Message-State: AOAM530KDUiUSbq1whj/8TM4TUs602HrW+TiF+CGUBFqzQMIGVoOB1xU
        1F7T8joeXZtooKADk4LC9m4=
X-Google-Smtp-Source: ABdhPJxsG8eY7FoghI/aJTlV3ecDuy0RQuMpKsAqomxJRhzs+FdHGa0XBgIi9Nz0rlmnN+0cxk9Q8A==
X-Received: by 2002:a05:6512:31c5:: with SMTP id j5mr178183lfe.26.1593125453321;
        Thu, 25 Jun 2020 15:50:53 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id 203sm2377129ljf.14.2020.06.25.15.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 15:50:52 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_relocation)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eb3cac23-cd8c-732b-684c-c2d531de00a2@gmail.com>
Date:   Fri, 26 Jun 2020 01:50:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8d60baf4-45e8-296a-279e-dc105966361c@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.06.2020 12:27, Mikko Perttunen пишет:
> On 6/25/20 1:33 AM, Dmitry Osipenko wrote:
>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>> struct drm_tegra_submit_relocation {
>>>          /* [in] Index of GATHER or GATHER_UPTR command in commands. */
>>>          __u32 gather_command_index;
>>>
>>>          /*
>>>           * [in] Mapping handle (obtained through CHANNEL_MAP) of the
>>> memory
>>>           *   the address of which will be patched in.
>>>           */
>>>          __u32 mapping_id;
>>>
>>>          /*
>>>           * [in] Offset in the gather that will be patched.
>>>           */
>>>          __u64 gather_offset;
>>>
>>>          /*
>>>           * [in] Offset in target buffer whose paddr/IOVA will be
>>> written
>>>           *   to the gather.
>>>           */
>>>          __u64 target_offset;
>>>
>>>          /*
>>>           * [in] Number of bits the resulting address will be logically
>>>           *   shifted right before writing to gather.
>>>           */
>>>          __u32 shift;
>>>
>>>          __u32 reserved[1];
>>> };
>>
>> We will also need read/write direction flag here for the
>> DMA-reservations set up, it will be used for the implicit BO fencing by
>> the job's scheduler.
>>
> 
> Ideally on newer chips with context isolation, we no longer know what
> DMA-BUFs are being used by the job at submit time - they would just be
> pointers after being MAPped.

The DMA-BUFs themselves shouldn't be needed, but GEMs should.

> Do you know how other GPUs deal with DMA reservations - I expect
> separate MAP and SUBMIT steps would be pretty common?

I can't instantly recall what other drivers do, could be worthwhile to
take a closer look.

> Do you have to
> pass the DMA-BUF to both steps (i.e. do IOMMU mapping during MAP, and
> manage reservations at SUBMIT)?

Yes, this sounds good to me if DMA-BUF part is replaced with a GEM.

Please see my other reply regarding the MAP IOCTL where I'm suggesting
to back mapping IDs with a GEM.
