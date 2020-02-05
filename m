Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 050AA1535FA
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgBERLu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:11:50 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45489 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbgBERLu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:11:50 -0500
Received: by mail-wr1-f65.google.com with SMTP id a6so3643574wrx.12
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yf4xW/LIwGG+ySHgP0MFm4R39Zn9y49rgtedQvVWREs=;
        b=LgjrVUzfsl5GxUXObZxmafNP98ePgOGPypHIifnCY/QgRGlF9pVsjg3S2enmJv+rMB
         UpzaAA7CSsqgoEc3l7NBoUGKefinZIZHiusr2jMF25DXoHBWsUebUNYV43OGBqPXjgz9
         66vg7GeEmnqSCYj8TK0cSo29aGIDnaWgOdNK5d4Ri2UWz4cZ34SAzUtmcQUVztUiXmaZ
         0O+z71wgcSXv4pWfap5M58Y3AU3SRZIR8/ePBE4lmHV1FPLw+mDFAIHjgkDNvbkYaOSp
         IuUHk/AVsBDkOp+KjNmLj3P6Qb/oFrh6pNERQCQpxiazv7qd5TY03PX4ff8kOemb5hi1
         scyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yf4xW/LIwGG+ySHgP0MFm4R39Zn9y49rgtedQvVWREs=;
        b=GaiSIO9b2cSKVlFEdvbKEOxVONhnxxzQgXxJF38BX7QPyj4fy0CN0vR5UQ5MD6zyQ5
         B9ABHAxZ7y82NtLMDm9xmy1MbDh2kKp/uqQgoTMQ1boEL/gRj+7umkZ17F3tqMumqpHn
         SDvdvACaEIV/oMHEU/xjydKheTp6MpenJmFmtralPyIcL2FtIIfzeJMLg2OdJYWJFLN2
         Nyp5GXRTUjyr2Q9miHDQPrEqdrswV5vOQeypnmgiASjiZFQCALxMPCPPtbBeIz5EBnmi
         kcIiZt0Q317wQlzogEnsTABz9WM5j4HUPREktKN1lVnhE7dTB+8hi4vX6umSNQNcnbEb
         XtmA==
X-Gm-Message-State: APjAAAW16wNuDi3smf9OL8sgkg5MTmW2M9dl4/g7UaZK+Dn/lXVxgsyL
        1aTK/OD08IRXr1wDn7XvBYA=
X-Google-Smtp-Source: APXvYqx4MoqiqALRTIScG6Dzb10pWmOxotqS7tYt2j0uvPD+rV7zJyucLtLEXOrIIq6gtaIsvdJoOg==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr28151088wro.234.1580922708288;
        Wed, 05 Feb 2020 09:11:48 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id m9sm557235wrx.55.2020.02.05.09.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:11:47 -0800 (PST)
Subject: Re: [PATCH 3/3] gpu: host1x: Set DMA direction only for DMA-mapped
 buffer objects
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-4-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1a58a820-0765-d0f7-90a2-c863ae8a0b23@gmail.com>
Date:   Wed, 5 Feb 2020 20:11:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DMA direction is only used by the DMA API, so there is no use in
> setting it when a buffer object isn't mapped with the DMA API.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Dmitry Osipenko <digetx@gmail.com>
