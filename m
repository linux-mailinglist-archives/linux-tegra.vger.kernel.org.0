Return-Path: <linux-tegra+bounces-869-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F42857F89
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Feb 2024 15:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B4B1C222DB
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Feb 2024 14:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C0912F5A0;
	Fri, 16 Feb 2024 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W49GTaCy"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153612F39D
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708094442; cv=none; b=pkMS36Ws8s2jFB4AjobfmMz57aCSTuVw3SEJ7IeP9NSsybX5Mgc81E98xTd2sd3IU0e9Cr3ldroYPgqI4cFl0RT0OPDX/wZEl0/04G2jEnsncJgaeZdwX7ivoNMLBg2a8uCvsO5TL7Iuho8Y3H0u+vwULUgiiallX7op1+7Rmcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708094442; c=relaxed/simple;
	bh=pD34V4Xis6XvSKzWyAyrm6YM5UjXrZYGLUr4MspUCqE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f9qOdr6kouWJCHuCSv2sJLhJ9r9vYJUItELeI1/erO9JWmAqfxays4y23+bkzeKjlNlE67Kp0ILDc11MoNyOBunkf+B9zjFCE5zGWeXwDpiGcjkqNV6hwK55hzRYjj5E3+qm00XJMTA5V39CcKw9Wfnejet46+lbv7e/UxpGr7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W49GTaCy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5639c8cc449so1089133a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 06:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094439; x=1708699239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddHRp/a7ql2hO4wtU3P1Kr5z86y1yTWMkn8d+hM85z0=;
        b=W49GTaCyJs11FwPkJ+dUvl8jE2fMAalodGP6ajU/LhFoLdb+Y1eKZ88yYH30g+//gN
         XjOjsWtW5MqSrgpb72vRmcY8RXXCj0ET3rRtEKZahhg5Xbq1BKXSeAObBVpjqSel0F8l
         miuw52CGK9EjBkxYqP4ZNJCn0BPq02EmRadZ5qoqVdkIV0MOrJoY5y1ArluR6aHSP6KM
         QpUb5SC61Ds9K5yanjidGNDbYeHFjS42Sd4POQ2HOQ+a4BNbXkMAGR7MSWeiyNCt9Hpp
         IqnLIjgGVV73epu2PL7OtbL4j86Ycpw0lYq5074zysRTYjDMIWFTiacVg/Bi9QVNzye3
         Vf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094439; x=1708699239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddHRp/a7ql2hO4wtU3P1Kr5z86y1yTWMkn8d+hM85z0=;
        b=D5QI4v0hehzm+wI5nwEKy3r+QL7iZNr6DUAVfARON6s5Zf6SIE0xaeBLlWvYrGCbhB
         2SjIwwOWiFj8XKk63he9qdiz6XKYpyKjXSoZ1MM3O+DihMY95a/qrXc0qZN/R6T9DR1M
         zFyl1KK8AwrpENMKSmz9qIbfY7kRYHy7iF8Wvjs/zz9Ta38JbqgDer/bk+9jAixi7MKk
         ArLnShPk69IyuN0txTSPEC3hdQORcBx1Z3shksZ45hiBrScfxUWdwtUK1XTMn6sxdn8Q
         8uYjUFr3Fue3o8aUs43W25Up4Wh7lzAzqG8i6w+qxRpjTRWskIDfm/Y31ThirD32cOek
         Z4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVFzcn2mrJnHSFlkumjSEmzasrmQkCtIpboU7W0F7luqFhqihBH5j36R/aDNMCjn2zMKVjbtrjepdyHZGGFRTBtfMG9s9NE5bNGGes=
X-Gm-Message-State: AOJu0YzPuU0xRFiI33ZNI7FLG85qvkZjEHo/2VbSw9YhFWltMQbQYPww
	NIWYtfqEQLI2ZJZRGgrgUOzUBctGDAeJdM0maM+YnZ+vlIo1Ka/kygtL7gROpDQ=
X-Google-Smtp-Source: AGHT+IFjUr0pwHx7I9NJd2MhgZLwiZF/Q3I4EAlN6VBXxRxf0gB7BEu6U93gT2kjFbtxE6rZ4t4ByQ==
X-Received: by 2002:a17:906:d7bb:b0:a3d:704:d688 with SMTP id pk27-20020a170906d7bb00b00a3d0704d688mr3675983ejb.47.1708094438802;
        Fri, 16 Feb 2024 06:40:38 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1592942ejp.195.2024.02.16.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:40:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 4/4] iommu: re-use local fwnode variable in iommu_ops_from_fwnode()
Date: Fri, 16 Feb 2024 15:40:27 +0100
Message-Id: <20240216144027.185959-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
References: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iommu_ops_from_fwnode() stores &iommu_spec->np->fwnode in local
variable, so use it to simplify the code (iommu_spec is not changed
between these dereferences).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/of_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 719652b60840..3afe0b48a48d 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -29,7 +29,7 @@ static int of_iommu_xlate(struct device *dev,
 	    !of_device_is_available(iommu_spec->np))
 		return -ENODEV;
 
-	ret = iommu_fwspec_init(dev, &iommu_spec->np->fwnode, ops);
+	ret = iommu_fwspec_init(dev, fwnode, ops);
 	if (ret)
 		return ret;
 	/*
-- 
2.34.1


