Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 000DF14DEF3
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 17:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgA3QWf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 11:22:35 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:38856 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgA3QWf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 11:22:35 -0500
Received: by mail-lj1-f182.google.com with SMTP id w1so4021470ljh.5;
        Thu, 30 Jan 2020 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8ydSULXhpnS+IHlEO6mcIkif2rvznLkOx5g93ANwtj4=;
        b=YrRv+ayu7UpfrV7pGLy+a1wa+oHB5N0itiEYbS0LqezYldLZ/c5CbJ9JuJueg/ZIN8
         ejFl4HxejjDlj5znzvNDPmX7FC2r4Iq2JwbkdXdjxaX4mufNsu39LSXsuu02VtONt8bt
         gLq1RkSU5ixbkximWiTgdoFw1RLbmbdyCmoWbKBgUHvBb4TNbxHMhS4zG0ii7hJFt8xp
         GYF9XGi7MNZSrWpWESncKX6fFdJYOU3Jm2xgyB4zOgz52mwhUMOJV0S3Fw/bNdRoJp9b
         IHSgAcsDWGGN7BShK9aDO40u4jM8g+/MSRnAwcbW3rsXVkBXgvJvvLgHPH73WZTFvF+k
         SeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ydSULXhpnS+IHlEO6mcIkif2rvznLkOx5g93ANwtj4=;
        b=YohuPuZdOZ/33lHb+urHDqeVFN2Ah+/Fsvh5rdkr41l+uLS55oKHmPZFraCMk6tB4Z
         +G1u0hMII3izYjjxbD2sLcXfFrPHSOhByWNfmvhi23viRfS+uHNyHV03miW7OjYyY98o
         FYnfc2KYaoktBYbYwlKLNTgtP/cPmqbs7PahI0OsbsRpuTSjsiMo2cWno56Lg6fvvNQ7
         leoP1XGSPpqv7aihhk6/aaFBDL91y6wrHU8a6e4l3qOtvH0JiKmPFG4qcc3C2TClXnSy
         a1u0he3UaGhc2kgtEI4A0EJ78bSJsxapKif476f4/1vxlJuJD7I1S5xLYp/Eq2k6OiK2
         4z0A==
X-Gm-Message-State: APjAAAXcnysq+TQP31n2shNcMnWkMSWruJQbZMRTrBdnJ6hsy3TOvNM8
        f/2vKwBROILNjtK+OSr82/U=
X-Google-Smtp-Source: APXvYqygtCrUmUdUJMmbcfRWxioa9pHzvzUKG7bRsZbCukhjXSx3+2knDTwFGBmnS2g5idn/hQCveg==
X-Received: by 2002:a2e:9d0f:: with SMTP id t15mr3339882lji.171.1580401351910;
        Thu, 30 Jan 2020 08:22:31 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q10sm3258034ljj.60.2020.01.30.08.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 08:22:31 -0800 (PST)
Subject: Re: [PATCH v2 5/9] ASoC: tegra: add Tegra210 based AHUB driver
To:     Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
        robh+dt@kernel.org
Cc:     broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com,
        mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com,
        dramesh@nvidia.com, atalambedu@nvidia.com
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ef701838-be43-e42c-9245-b28cda5ed9bb@gmail.com>
Date:   Thu, 30 Jan 2020 19:22:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-6-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.01.2020 13:33, Sameer Pujar пишет:
...
> +static int tegra_ahub_probe(struct platform_device *pdev)
> +{
> +	struct tegra_ahub *ahub;
> +	void __iomem *regs;
> +	int ret;
> +
> +	ahub = devm_kcalloc(&pdev->dev, 1, sizeof(*ahub), GFP_KERNEL);
> +	if (!ahub)
> +		return -ENOMEM;

ahub = devm_kzalloc(&pdev->dev, sizeof(*ahub), GFP_KERNEL);
