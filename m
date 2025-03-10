Return-Path: <linux-tegra+bounces-5522-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7ECA58BBC
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Mar 2025 06:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720353A8A78
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Mar 2025 05:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B221C1F0F;
	Mon, 10 Mar 2025 05:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lsYelF8V"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744B7184F
	for <linux-tegra@vger.kernel.org>; Mon, 10 Mar 2025 05:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741585835; cv=none; b=NbFWi6I5K/IYO+mQ4mGAa0cqWgDx6yKkBSDyi+98OcuwYX/r3qIWlNh7rTbxnSrkYCNqIkCRa4+6UJhfg7OsOVWcaPg958cbbLXg0iuU+4uElNCohP7EXqgzuyPmjRLp9W4Z2BlNJGuJdQi1JkzA6xnXQcKOl95m7vsP1dxS9yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741585835; c=relaxed/simple;
	bh=zYnvO7UxXaLKDgnQdtARGxHYoWdcUJWZPhez49Oo7HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzKu1BBbhXrFzuaYfIxz33xR/z1SZXqAdubF39hhdQbunSCGiEL0ox1cwdlvDRS+bdrad0jMqeuPMuiVwfjLqn7ZSqDudnFx/DPTdd/o9XVOgVF2gDRDQL+JhmkzegVTngo3qjCs/EbeqQUb1oszlwRXwydHkiFVJwSeATyOBJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lsYelF8V; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2254e0b4b79so32444965ad.2
        for <linux-tegra@vger.kernel.org>; Sun, 09 Mar 2025 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741585833; x=1742190633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwUL+b7ViJdTbaqWpBCbM43ivsoRmiuqDxKHQGJRDvo=;
        b=lsYelF8VO/wVUjaV36pPJvzGnzNrVXBmOxjOXcbW9T9adNqy1w7H7YZm3JH6Zi7mPX
         DEOejG45HV4inYdrOVmVkfG1XS2CAhDL0ufkHN5zObwGIhhZPsf0cfgu8li36aRR9DXW
         9X8VuONPHJzMzTU2xeKxsM73CmsW2Kn9IZdW/tJxdm6xCdaSCaLcpccQAC5AVkKdu6h3
         9MbopGVLHCOScwMj+4+RuyycmfV/AU99HOIijxo+gLTOaw3Eiqp5GQp6uZwvuVftIkcN
         74Rqk6ePDcixAumaaI2OQodmVWXjANuwAnHuLBVIzilLaRrTMvwzsxNDkHDqtBx50HcJ
         rWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741585833; x=1742190633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwUL+b7ViJdTbaqWpBCbM43ivsoRmiuqDxKHQGJRDvo=;
        b=pUuCW+P4EiJnc+dJ2shZvE25I1BKcH2j02Y7V4nVpxnhEqyK1FQFfHpKysTAqlHnhL
         MDCS7zLNcmk40RDEZvpBCweBCqzk0fLkfGvogC8YsPjsGF0YckD0PmKZEcq/+rXAla1Z
         VUipT9DYKvty+MsOd5iHXqKu4917IzA5pKakeoORFBgttMlQt78ih6GJbLIqi4RG1Snb
         EUei8jRa3s7M9k7ZYkg7XqMsIRTRQ2KyJdUIMJp4UZeTKQ0mlrsr3UIO9VEJvURThhii
         LZX9Ledd9zod+OexmQiL6ABEumDfrbFYwrPlszI5reWChqCzUSlZqvTsEMETAxUCb9C2
         Xiew==
X-Forwarded-Encrypted: i=1; AJvYcCVsn9VyIkSIOYjCcxvh+8oS0rfQcDNHX4JTholOSRTKSM0hCHjChwEusHr3WTSWI6h6QEei2YNYM/PuBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYFqOb2hJJghYkT00vqAbk0wp9vSLblLv/1FMLp+zpGpUkxffd
	vLgPaxHG9PnytdbaW0voixidqLQS3NODj6oOKLdHU1LUCx9hE2NR12sXFdC2S1A=
X-Gm-Gg: ASbGnctTWna4zzMxPZh30cuUISZxI9Wd1Ku5K3DAETqtMS/jvgu+vmyKmEmuh47JbeX
	6DFNFu38e34HBrNLmDdA0aHuaNiLi3luqR9jqJlhwlWIQ0BAS7vG6TbE34AUDba24mMg5qoFruo
	ed/gg+KL76Od7V3wXJlVk9qig5wOFCrv/B7RkKLUK7oJSF+r7zIcZUOEzYu23k/HgEeJxnUl3C5
	ZpMRBhhJHj29gjFu+EhiYTEnYrFtXbIgeuvU+dMPfRGQsf9kS2fKEZja1e1jkwhr/7VQ7cZ4ZnD
	65yY4GZNrAo6otWUWP9hKJ8OG9x8dsN+HZdmnsbl0CghlA==
X-Google-Smtp-Source: AGHT+IHPp3K4l2ZyxYf/rKQ3RqUoT3ZhMn6STVsJw+Ky5U+CU8LfyTho0FXbT7xpiSFmiuzSgnUX3w==
X-Received: by 2002:a05:6a00:b4e:b0:736:592e:795f with SMTP id d2e1a72fcca58-736aaa1d1d6mr13217009b3a.9.1741585832714;
        Sun, 09 Mar 2025 22:50:32 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736ca79944csm2481508b3a.87.2025.03.09.22.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 22:50:32 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:20:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aaron Kling <luceoscutum@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2] cpufreq: tegra186: Share policy per cluster
Message-ID: <20250310055029.7u4qkmcnfqhtof24@vireshk-i7>
References: <20250310-cpufreq-t186-share-policy-v2-1-d0b743cd051f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-cpufreq-t186-share-policy-v2-1-d0b743cd051f@gmail.com>

On 10-03-25, 00:28, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <luceoscutum@gmail.com>
> 
> This functionally brings tegra186 in line with tegra210 and tegra194,
> sharing a cpufreq policy between all cores in a cluster.
> 
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied. Thanks.

-- 
viresh

