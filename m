Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A18B411E6A3
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Dec 2019 16:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbfLMPf0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Dec 2019 10:35:26 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34253 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbfLMPfZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Dec 2019 10:35:25 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so2287098lfc.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2019 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P748Vsp09cCRTRcxy70hlgcdkJz7E0UTUbE5zxl6voc=;
        b=VD6f5w97NY3gcooN97XbqvnT/Br1DI5DCw9FYJLBtQFsBThPlz9IBIhNH6oxgpxQeL
         dRD8cGFDUh6JMp7ZBzCxo4K8arT7Mesy41KOmPNW7e1YnJmTnJovUMdTTcEBooYsXfdv
         Y4gHujAkyKh1Z2JfWp068Brc7+uDS6YigBFtqjnnEGMPXU+XkdJoFleN0XaBTYhLFokO
         1CBa6xCMcieD4WrKHV8qUbOqWL6iEixm1w6f/JXbDqecPP/wEcJyYFO+vFJ62GJNlvfr
         agVKwsa0A2cx5WG7ufyshCeVAz1BUYM+FFmUXlYW++RuMcgX32ISjWHni2pjgUYtmQsd
         CLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P748Vsp09cCRTRcxy70hlgcdkJz7E0UTUbE5zxl6voc=;
        b=PQBolhTBLMGe9I1YhSKFTwUpasl8goiMUxzd9MtJUa0gqLn5UOZkeIO7ExIbCrlnMP
         2S1gbwfeOiaao7LUvmQK1NrMFCZmgT/7eLg8RJ9ft7EqIILty8z5gHsb0X/LX+qLUmlL
         nrAkPnZgLOSW3gbCyQaNKyvI3rBbeqDB8HE/ixGChMHBdmrYvJAPDjul4RbwsKFJDKG4
         L6Xt0SQ9+cUHyS9u/sy1Sx0b9fH+9hObpt8EEW/5RU53sByBJAEpxoq9P00r0cNDtfCd
         rGgQgA/+PtiXRg5UMJgBqTiywnfcqi8Z1QEbyEg8asMedQY27jHObhUzYj+wCFpvaWPe
         tK6A==
X-Gm-Message-State: APjAAAWO/4g3BfluNE+/k865E36j775u0FXfrv8ktHwMQDFN7x7VH31q
        wHlS0LbZ9GcbXyPJbq5lfDU=
X-Google-Smtp-Source: APXvYqxKzjmZ4Yx0JOzoVg23GJOQquInIo6XIAoRuSVfBy5812lcbMiIrxHtnQtwhPEeX0pF9HuC/Q==
X-Received: by 2002:a19:7604:: with SMTP id c4mr9629825lff.101.1576251323734;
        Fri, 13 Dec 2019 07:35:23 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id n5sm4975554ljh.86.2019.12.13.07.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 07:35:23 -0800 (PST)
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
Date:   Fri, 13 Dec 2019 18:35:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191213151045.GB222809@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2019 18:10, Thierry Reding пишет:
> On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
>> Hello Thierry,
>>
>> Commit [1] introduced a severe GPU performance regression on Tegra20 and
>> Tegra30 using.
>>
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5-rc1&id=fa6661b7aa0b52073681b0d26742650c8cbd30f3
>>
>> Interestingly the performance is okay on Tegra30 if
>> CONFIG_TEGRA_HOST1X_FIREWALL=n, but that doesn't make difference for
>> Tegra20.
>>
>> I was telling you about this problem on the #tegra IRC sometime ago and
>> you asked to report it in a trackable form, so finally here it is.
>>
>> You could reproduce the problem by running [2] like this
>> `grate/texture-filter -f -s` which should produce over 100 FPS for 720p
>> display resolution and currently it's ~11 FPS.
>>
>> [2]
>> https://github.com/grate-driver/grate/blob/master/tests/grate/texture-filter.c
>>
>> Previously I was seeing some memory errors coming from Host1x DMA, but
>> don't see any errors at all right now.
>>
>> I don't see anything done horribly wrong in the offending commit.
>>
>> Unfortunately I couldn't dedicate enough time to sit down and debug the
>> problem thoroughly yet. Please let me know if you'll find a solution,
>> I'll be happy to test it. Thanks in advance!
> 
> I suspect that the problem here is that we're now using the DMA API,
> which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
> that that code doesn't coalesce entries in the SG table, so we may end
> up calling iommu_map() a lot of times, and miss out on much of the
> advantages that the ->iotlb_sync_map() gives us on Tegra20.
> 
> At the same time dma_map_sg() will flush caches, which we didn't do
> before. This we should be able to improve by passing the attribute
> DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
> maintenance isn't needed.
> 
> And while thinking about it, one other difference is that with the DMA
> API we actually map/unmap the buffers for every submission. This is
> because the DMA API semantics require that buffers be mapped/unmapped
> every time you use them. Previously we would basically only map each
> buffer once (at allocation time) and only have to deal with cache
> maintenance, so the overhead per submission was drastically lower.
> 
> If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
> may want to restore explicit IOMMU usage, at least on anything prior to
> Tegra124 where we're unlikely to ever use different IOMMU domains anyway
> (because they are such a scarce resource).

Tegra20 doesn't use IOMMU in a vanilla upstream kernel (yet), so I don't
think that it's the root of the problem. Disabling IOMMU for Tegra30
also didn't help (IIRC).

The offending patch shouldn't change anything in regards to the DMA API,
if I'm not missing something. Strange..

Please keep me up-to-date!
