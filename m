Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165CB3F6261
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Aug 2021 18:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhHXQK2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Aug 2021 12:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhHXQK1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Aug 2021 12:10:27 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FBFC061764
        for <linux-tegra@vger.kernel.org>; Tue, 24 Aug 2021 09:09:43 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id v2so21011311ilg.12
        for <linux-tegra@vger.kernel.org>; Tue, 24 Aug 2021 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KPW/zCLADl+/x8mjaWyB9hHrERv3/cFvZ3EcDXUnTGs=;
        b=UvgljiCU/qTotkeevGpvN87BXMeB5N7Y7pCepdhvhQvgFo6MCZlJLEUD6bjbMvO4cD
         /xsdSyzfFzE5OkyJi7c6nuTOONQGYKIWnSoE50vSXqHJgv7xMTf+KPi6O5zh88uPlGML
         pnDGj9cAeX8AGRhi9mya8VyDmxQYhC2wVoJ8NBv2NPrBNDf0RHNBd/YOIWBKI0c80BS3
         +ZAdKVddT9xOHCCBqEmCaAouTjv54NLYAG0X9fRGghfAO71iFkDfMcqWl7V3zPsYQ6kl
         pVWexwO5TlaGxbVlxb0U10x3gEhXsdOjhxSoz7EbUDzpdra0uBjVyP5Z9PvX2Yct02Re
         bsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KPW/zCLADl+/x8mjaWyB9hHrERv3/cFvZ3EcDXUnTGs=;
        b=PpcwEruJYgpEJ1hti7clg1uGxANDuw7gTB5VQrrfHtXSmYkfwIPTyyeT7YRHtgP/bd
         POBf2++bj9Tf5hbzfk6/H7LiQ0UuqNfmfCNhZhtpypm32xwv5Y27NK9UMI6p7/PhSami
         VGBlMA1ItrPszLvgj5MykhA+AXU7749G5Bkoqflco88NFBb8uSxnKJl9G/GPEQ8VPeli
         d5soxc64LoMODOq03Y2SqXmusOlyY1Crsd0pZ4LbbkNZKoS90H3OYtOVJ0r02dJCAOuQ
         K/f9bXDm+kySZHVIlbKIfatgcSNR4PKSBXnbzePXTBaDfAELirD8LmVhc5i0ocm1AduU
         WhQQ==
X-Gm-Message-State: AOAM530LDjUBtfP+p3YJtg5ujMNlq3sWmxFH/zHjoQWAgQMRboDN9hGW
        Q4642Rtet25jOnocDjwlzFWfKw==
X-Google-Smtp-Source: ABdhPJxuefLOk3Y8FamWGbcEoys/oG2g+hx17beixKMm2H8Ty6iMdyBZ7klTUmbd61entWvNfUcGgw==
X-Received: by 2002:a92:c846:: with SMTP id b6mr18190561ilq.84.1629821383037;
        Tue, 24 Aug 2021 09:09:43 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id y11sm10004048iol.49.2021.08.24.09.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 09:09:42 -0700 (PDT)
Subject: Re: [PATCH v7 0/4] Support EFI partition on NVIDIA Tegra devices
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Rob Herring <robh+dt@kernel.org>,
        Ion Agorria <AG0RRIA@yahoo.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20210820004536.15791-1-digetx@gmail.com>
 <CAPDyKFpAbLbHPP1R_iLw380Z8AgonrfC-vLBahHo6tKtQh9Fdg@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f0c61ef9-63cf-c429-e419-951f2a43e719@kernel.dk>
Date:   Tue, 24 Aug 2021 10:09:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpAbLbHPP1R_iLw380Z8AgonrfC-vLBahHo6tKtQh9Fdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/24/21 2:48 AM, Ulf Hansson wrote:
> On Fri, 20 Aug 2021 at 02:45, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> This series adds the most minimal EFI partition support for NVIDIA Tegra
>> consumer devices, like Android tablets and game consoles, making theirs
>> eMMC accessible out-of-the-box using downstream bootloader and mainline
>> Linux kernel.  eMMC now works on Acer A500 tablet and Ouya game console
>> that are already well supported in mainline and internal storage is the
>> only biggest thing left to support.
>>
>> Changelog:
>>
>> v7: - Added r-b from Christoph Hellwig.
>>
>>     - Added ack from Davidlohr Bueso.
>>
>>     - Renamed MMC_CAP2_ALT_GPT_SECTOR to MMC_CAP2_ALT_GPT_TEGRA,
>>       like it was suggested by Ulf Hansson and Thierry Reding.
>>
>>     - Squashed MMC raw_boot_mult patch into alternative_gpt_sector()
>>       since both now belong to MMC core and it's cleaner to have them
>>       in a single change.
> 
> Jens, these changes looks good to me. If you have no objections, feel
> free to queue them via your tree (I don't think there will be any
> conflicts with my mmc tree).
> 
> For the series:
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Added and queued up, thanks everyone.

-- 
Jens Axboe

