Return-Path: <linux-tegra+bounces-8847-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F66B3B2C8
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Aug 2025 07:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096C93A0FAB
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Aug 2025 05:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6114221FC4;
	Fri, 29 Aug 2025 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p514Sl+B"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0EB21C16A
	for <linux-tegra@vger.kernel.org>; Fri, 29 Aug 2025 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756447190; cv=none; b=SjGPMp7cRHAigHGPYyT6tr+Xc7y64nA8bnpySh3FWRE1qD/DYJHj5BwiLuZD8QAzUaJV1kPIyEnHdbfXoC3UAaY/3C6FUX2qlafoKqbDbIgetUEwjrf/uJpd3g7+jomaRSUKeuBEZSM7R4Vz6FZvnxzoH7CbTb7p3BLfE5SOXMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756447190; c=relaxed/simple;
	bh=3Us6gLaZK2VccDGA6IMnqvs0nFzgbS6I49Q/8l1+6ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjJj/y72cyuez4dkU/yWpJr3vnrGPyrdHROaN5mIRiGHUQDWV70qnvjusJRf73KRmxrtUsp9qQjQ7TvXdjetX6U8CAr6i4WCltu86ID7v2+nP7Q42YDO4fhFhDAKqyeQIWpFT7NaaeiDbmS/vt2u76IG8Mfu8s8mEPvQqheD5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p514Sl+B; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7704f3c4708so2117094b3a.1
        for <linux-tegra@vger.kernel.org>; Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447188; x=1757051988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=p514Sl+BuFb2jJ5R5DjvdPuZbJD/3N094aXwj3h0r/jhqjJ8E7yP+k817tMndGWuRR
         FJyrpnjrOC1v44RKZW8+hYv/s/oQyyrlN51j6gPDRgosyonW7nobHk+dEVSc4NB36Yw4
         PuqLoIM2bQWrSvT363c+fY0yOV3vZSKbC+7dp3aQmV8szSfmyrtVMuT0C6uReUSabLLQ
         QNCTGNg39LLVhpXBLI27D+yN4JWIztFIMPiYxMxgFB1nTSvmERBka41rfpTaGJms0EBS
         6QVx0xOpRrajJT7Gzpak3rJcIdO5m+Vx4yWFoMbU026CqovfiV44HAzTUMYSrkn9uYWg
         J/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447188; x=1757051988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=J9q/pp/sx2HNklHLclE/MOCX1tyNtWn1XXpml9SpvYY2+R2xkq1W9CXbCNkuM88FLr
         RcWycu+1mZ+ZuSCTiUWVYfGMQe3nu9eOgOF8wq86PwRQPEzXcpHpkfpZiqk5CRqgu0oS
         p6X7Ox5Vo+5STBTPkKGId0aeUYPoPJJdYCMG44zFw8ZUk3qhAx1EAOX++yO/WpLVvgKN
         gJIDR+mfgUmDZPuCQlBuDAaeqlElCx6EbxiUGQ71NVUMZ0P0kgE3DYvzAjEvmx7YZG24
         dBZj/mDU4N0ItcM2h30JlaRW7bavbOQFblU38Q1LOeErIjJiyjf5KHNrRaVCaNscrdR2
         UlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOML9PtfyuPE3GxKxXI3ab7FTXfMUQ/sgw/1OuO2b7gU4+p0VT+6wyDJx09U2Y6/jgKu/SNQuxOkYdWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLv/Tdxxt0fzzj8SO8Xpeiv0Vge1ODLh8hGMO2wvv+p+Sqtlqg
	JY4JU9Cf2drrecVnluKyAvqN5DE2cmKMAvj0gTIu/eUjnDlvaDuUN6Q+CzBtAPGtZgA=
X-Gm-Gg: ASbGncuq0OvYkdHKLBgvEsBtsCcO0RsThQUHPjtMTPqqDZ45j2EFAJHYXfayCrwypGG
	uVD8RSfPNf1yYBDwtAFmsTlIg8yQaocfCs7SV4/4O18akycrXeuM06xvjxGIcuBvANTs/7dleT1
	1TGFi8qHcpUaXNHHVVIW5BGqt4ei8maD8gCKL1qqRhgqRty4klPIIE9/ZoAQhSrSGwaMe9oq7ZF
	nFJQu2awBc38qvegbBrh40RxzL2227tHnTiOKYOdnlS+XWAdKNQ7Bewo7RmGjkfKrdfwuMou0gG
	9i6oxISZsvvSYOs0Fdh3bstuR8xNAKFmbiZ4Q1tQbfxVuHbXSlcq+qmnLiq7LFfvydNe0f3xVx1
	wOGbyHekqDg6xzYOnmdoLsocxhpH2umGEWEA=
X-Google-Smtp-Source: AGHT+IFsar3WOaSA9RKNM7TPFf9gG0iXTxdUF2CW8raU1SyelgEQswrlDbapLb2rA7PUFkb3M17NCQ==
X-Received: by 2002:a05:6a00:10d5:b0:772:2850:783d with SMTP id d2e1a72fcca58-772285079c4mr3285667b3a.22.1756447188084;
        Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b14c1sm1263485b3a.31.2025.08.28.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:59:47 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:29:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-5-zhangzihuan@kylinos.cn>

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

