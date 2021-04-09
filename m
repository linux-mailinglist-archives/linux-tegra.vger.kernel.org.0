Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A26B35A093
	for <lists+linux-tegra@lfdr.de>; Fri,  9 Apr 2021 16:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhDIOBd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 9 Apr 2021 10:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbhDIOB1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Apr 2021 10:01:27 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B22C061761
        for <linux-tegra@vger.kernel.org>; Fri,  9 Apr 2021 07:01:13 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d124so4277502pfa.13
        for <linux-tegra@vger.kernel.org>; Fri, 09 Apr 2021 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6eCIOZtRskFd5iRZl3iLyX27/3QMWpN7siJJcos95N4=;
        b=o3gxix8Uk8CY+/8UAMDuUSsRxf+63cR1Vmx6mChO/Mq3XMk8NtMKzJ2SXX12mcRn12
         qjsSbp0a3jeZZCKplrzaN04O/ObIyn2LjGYbAIzg4bD8PMeXRT26lBN10ynxandU4xGe
         hNFoX3qupZWBjNzF2oZdx4Gg7k2qLOQa4DomFGvz2reginXttxo8elg8uMbu37YmZCsM
         T2+nj323H9lmUuJLEPs7xolii/0EeFnGD5vCQzYe+FfXXxtASu/N6ZqDgwiLpqTCwAnX
         j6UG6apDPX/nAGshHbFFujCbt27HmzYsU38LiU6Pq5ZginzsKVW89M4CJX/Cz5SyiFVF
         yKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6eCIOZtRskFd5iRZl3iLyX27/3QMWpN7siJJcos95N4=;
        b=mRhs2UnS5Pu48lBMnMGfrnKHlvkItQz4kfTjXay1uW/FchqfSfl90yb+aqX8bVc4jN
         ujrctQgETdvJlEZ3wX8cL3vcJZuJ8SQZeeO0Ovfymj/tNxWUZMyN/LC/deMO/h1GB/Yn
         Yt1s50/ImbWeDEDJCqq0ODt8uZE+89Anr1cRMx3mIHAFXxcx3VvgQ5Ia7swnmVGQFEJM
         m0wokdSvZOoOjnkbDamaxsncBVc7P4fFgVM5uDPw4QjjQAX+g/QFrbGjNQ2T3qI8Cqqa
         bytHWCxoSWL46H/qBhOlHFu6t8da6vm0TO5JDjM3k5QuZRw2S50prcihz5BMMKjkN9yl
         G6Kw==
X-Gm-Message-State: AOAM533cGazxjsTCHpUETvPHUgQd48G29KZSuUMBhz0mcT9LHHanogyE
        u+mzpkGp3XnLiRpwz8kjkg8eLQ==
X-Google-Smtp-Source: ABdhPJy/2ByF3EcSkPJZxhmKSWKRQXNCBWC/tLgJexjTC89PuC14Kd11uQuIc0y8x2ivfSr+f94ZtQ==
X-Received: by 2002:a63:cb44:: with SMTP id m4mr13402369pgi.4.1617976873031;
        Fri, 09 Apr 2021 07:01:13 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id t184sm2862124pgt.32.2021.04.09.07.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 07:01:12 -0700 (PDT)
Subject: Re: [PATCH v2] ata: ahci_tegra: call tegra_powergate_power_off only
 when PM domain is not present
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, digetx@gmail.com
Cc:     jonathanh@nvidia.com, linux-ide@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1617915315-13639-1-git-send-email-skomatineni@nvidia.com>
 <1617915315-13639-2-git-send-email-skomatineni@nvidia.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <6dc52280-03fd-f9f9-5fab-6683dbcaf256@kernel.dk>
Date:   Fri, 9 Apr 2021 08:01:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617915315-13639-2-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/8/21 2:55 PM, Sowjanya Komatineni wrote:
> This patch adds check to call legacy power domain API
> tegra_powergate_power_off() only when PM domain is not present.

Applied, and added a Fixes line.

-- 
Jens Axboe

