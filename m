Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 431451549BA
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Feb 2020 17:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgBFQyC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Feb 2020 11:54:02 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38945 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgBFQyC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Feb 2020 11:54:02 -0500
Received: by mail-lj1-f193.google.com with SMTP id o15so6848225ljg.6;
        Thu, 06 Feb 2020 08:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aYjPID+86AwFTbXgWpB4ZDC6SCfeqfl8MOuO71FjWTc=;
        b=Oe19er23o00T0c4K/YdRf6LayjLgkdOVvy2wtLnqQzWAXAfyTipZh+ox7V2UmKx6uP
         v0O+9GwYp6MaPZ4fG8bbVJKzfq5tQaAotTOLA7S7x3zLRwQW7IfOJEunjOuYlghcSFzZ
         vE46F9MJMajetQcMCYySEqElf+1oto5+pquM9b9ZJSIdta4OgPfE5ru6PdJ6v1dOVNTO
         xvUsVYpHfBIL9iVPUfDOAXEawcjRnYqfts+UBmW68uj08B+vQido5r868WqCADKNy8aA
         yE3E/VyYyltjpCdgHdppLbXEIGK6aHLIdAmUOdydd+Cz/AwnesEX5xISEFKM9j3TT/Ks
         h6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aYjPID+86AwFTbXgWpB4ZDC6SCfeqfl8MOuO71FjWTc=;
        b=GtrsMDuCkhNkQLJuc/OIN3cUyLFJrcJuYanBkmPTY6YOwZSSBm6puppf4W648A859q
         8KEjHg/YpzBrzjel3rA66/j1FbxzdqNO+l1O2DOzp9kTYY2DH9S+Drfez3+YpAU3UO32
         r/s4GI1OthTvbJRdI3C+hCdhd+msZqMBZZ6TG3JkEwBDM1VleQPBgPH2zyqAcrfldgGD
         GlTrFD8D4325ASbxnPQljkxJlsCUFNRklIY0UZtPeV2pCc3qkKkQaieZICTz9ofMmcIQ
         gnJUxUhXqnhEy2KA+2sm1C2GbOUkcq8tjpP+ychnFZK18U80CrlsbmTi8QIYxV03TpNZ
         ikSQ==
X-Gm-Message-State: APjAAAXYDN4FgoLxoQKwVF8zEfprFJvP1ys024Sq7KRwvDSHNzs63LNJ
        5G7bksUMbNMftF5Joyod+ZI=
X-Google-Smtp-Source: APXvYqx0LdMbwbSEVNhUV1hE5Xi3kfdxfUnR07rFEeIfYMgYE+cPOQLkO0RNLi/10WFfpWxsuIWmLA==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr2509962lji.137.1581008039144;
        Thu, 06 Feb 2020 08:53:59 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y7sm1649358ljy.92.2020.02.06.08.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 08:53:58 -0800 (PST)
Subject: Re: [PATCH v2 3/9] ASoC: tegra: add Tegra210 based DMIC driver
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com,
        mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com,
        dramesh@nvidia.com, atalambedu@nvidia.com
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-4-git-send-email-spujar@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9ada4090-169e-0767-db5d-739f6e621812@gmail.com>
Date:   Thu, 6 Feb 2020 19:53:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-4-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.01.2020 13:33, Sameer Pujar пишет:
...
> +static const struct reg_default tegra210_dmic_reg_defaults[] = {
> +	{ TEGRA210_DMIC_TX_INT_MASK, 0x00000001},
> +	{ TEGRA210_DMIC_TX_CIF_CTRL, 0x00007700},
> +	{ TEGRA210_DMIC_CG, 0x1},
> +	{ TEGRA210_DMIC_CTRL, 0x00000301},
> +	/* Below enables all filters - DCR, LP and SC */
> +	{ TEGRA210_DMIC_DBG_CTRL, 0xe },
> +	/* Below as per latest POR value */
> +	{ TEGRA210_DMIC_DCR_BIQUAD_0_COEF_4, 0x0},
> +	/* LP filter is configured for pass through and used to apply gain */
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_0, 0x00800000},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_1, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_2, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_3, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_4, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_0, 0x00800000},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_1, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_2, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_3, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_4, 0x0},
> +};

I'd add a space on the right side of `}`, for consistency with the left.
