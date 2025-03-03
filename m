Return-Path: <linux-tegra+bounces-5438-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3FA4EA9D
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Mar 2025 19:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49291188199A
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Mar 2025 18:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15842DE107;
	Tue,  4 Mar 2025 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRszQY0p"
X-Original-To: linux-tegra@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C142BD5AA
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110066; cv=pass; b=Vmo/fwkr4e1PiFAn7CYAgVzTWV4Ws0wU/Fpxmudxr+Pbbx4AFavKLInEexL9LwIzNiG9A+/ZwYX+E15f4IZpCVbmON4wBquR0ILlJUcEOkgG7TKXD6jgPMX7L3czSJR/qvMiBAUwVOlzBA7i/75gZMq7TzODe36YPmcLeJz4Gyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110066; c=relaxed/simple;
	bh=rxcijywZ3cJkNWyQcn7loTIiEZGWFkiZzNbQUTznWBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7SteOck5lDH4oWBto0Zkv2n/AhDOQewqecfrhT1fbh2yj8Ppe8DMf+B9CygM8xRJGeNlOkvc9WcoZnFthbEH7FPO1zy3mADA9unnV97apPsJ7jhdKBpf74rP3x5OsM/8BJ4KeH+Q6jneNCgdjTNnrFJdyBgQkHy7XyFclAQFWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRszQY0p; arc=none smtp.client-ip=209.85.216.41; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 65F8440D1F4F
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 20:41:03 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eRszQY0p
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6hSR2fHrzG491
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 19:47:51 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id B3D1242734; Tue,  4 Mar 2025 19:47:38 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRszQY0p
X-Envelope-From: <linux-kernel+bounces-541332-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRszQY0p
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id F2AAD42E3A
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:03:42 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw2.itu.edu.tr (Postfix) with SMTP id ADBC42DCE4
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:03:42 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5F3016F347
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828471F237A;
	Mon,  3 Mar 2025 10:03:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B21EE7DF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996190; cv=none; b=tWK1LZkfifVvTSSSesfFQdWzlnJHwiD01u5PQE9VhmLBgCEx3202Hxm4RZb21xZE2bhr/mw42MzVgCF1hc0Fd2YJwQhgGqIvh3moamNALhaK2Usmtasz7eQvcIf5idVUL3EydyWr9+/1tUUvasVgSgPVnqT06SHqCI4DmAjG0gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996190; c=relaxed/simple;
	bh=rxcijywZ3cJkNWyQcn7loTIiEZGWFkiZzNbQUTznWBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMA9VQUwy2wlYHaBrVgnti1Oz9JSxLI7atLLe/hMzZwjzsi1fiK0fuBzqTJVRJUkAkZXAH1hvXpQ83wz2QlSYSpUpMqLlpg8eCkdD2RY0u0xXuKc7Qn0dpW3EinrLr3wFbdxego11c9ot/cOTcckn3CIdhLvgiW7qV/1flCzm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eRszQY0p; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2feb96064e4so6210263a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 02:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740996188; x=1741600988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=11+AHdr6AYKpXcHhMVfNk2znRJeJwmBOEUdkFwvIoso=;
        b=eRszQY0pHS0XN/mruGO1bTKca76khctckWo4KaTe9sj8/pd03H5iJsFCUbjMGUAyAm
         k14Cm2ZUTz1E00YPQP96s4xHXs36dG+pq9zCYsIj00OHD1D9AWkgrr/I0EOZ2LSXEtO/
         4LBglnqGxXqbC/cMKjA8wI2NykCqu3i8R2AJ539LDjHKBWNSVk1n7g7VpZaggH5jEDlz
         JjJpVdLsdc4gPhknVuJftnimR027mDoGAG91U2EEVRnaJ1J8oT4m5A5IlgNPOutEHoUO
         cMjomNLPbhyYPuOi7yJtNxQMzvG4Kd2ElDkJeE8DQbzEm6abj4lGuDNns++CCzeB3Vcd
         XhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996188; x=1741600988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11+AHdr6AYKpXcHhMVfNk2znRJeJwmBOEUdkFwvIoso=;
        b=mk/GAmQbLqkRdcfb8tVHuFAs5r6LEcstBCvSYoU8uwLt2mvyVk6EBia1i8emHB72Am
         G3v/u4Pk81vuEP5g4cGhYFDmKUFWqea5RmDQZGB29Y855Oy6/B4xiHlNSX7ACle1pQO1
         11twI82lOpCvjc0sMziPvfFcqj//+J175CEhao7Z0XCN18uQZOXGlnvz45GD/xQm70xD
         /RWuBTeyYKe+Wsxmco00mET9cgVD/ptNxrfApfmwsXMO/ZBY6fhgADLv57tK4jwjEGMe
         m4u0VNOksNsmv+/FweA0aBnoBn52BW5NTzyQV5yM3dKo8HBsGIDzTPGGv51c96IM8Zw+
         O4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWhTZ8H42fmXtsjf3v6qnV93ZOOK3zKrzkm7Jhq86s4+XOQdgYk3Lyw8XC7BrslNjBsfnPsYt9Uv4AmcfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nJqPIU/5hnv5RQ4VjP0NwJvNhFKivQ6DPjoO8G+KUMjjNqVO
	0NYCzJOaxAaz3XUo6SQFLJjAtSj3uTqjukHkzkysDVoCM+bnVq7vmA1MDnSdH4U=
X-Gm-Gg: ASbGncse4+f/GOW8S2UCUDNedzFF/E+LYty2Lpdw4Ym/YJ1ua6azVWWXw8i3Db2WGRx
	umFUVbKni2iytCRVpRgzTaB6Cos3YpHuteib2dCAz6nIi25qYIGPVEwOOIF3HbqFMCzw2jFiDav
	wQYk3wREo9iFoMlyCr5qSjwCUNtKg48WD3jDplw7QH39lOHlfbkgNJz+QDnkKK8Z9pEjE1M+xKF
	r1PPQRmwaCm57YTsfDM0SEvSVF8LLFiX68otO1qhSpW66K2w6RnYeXfWRcOVhvfA20woYdvoLQ1
	GxC3VgUZkRTRvbqSlRFNT/V47JXOzQR3Wph7GP6njCkXTA==
X-Google-Smtp-Source: AGHT+IFJJ6O+Z6xQfN+8w8WzdswNxQSptrdoUx3ci2Ig09T5uOxOLT5TSvhtHvygzyM9QwBXAbOgtQ==
X-Received: by 2002:a17:90b:3c06:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-2febab2eaafmr20196910a91.2.1740996188522;
        Mon, 03 Mar 2025 02:03:08 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f15dsm10764987a91.44.2025.03.03.02.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:03:08 -0800 (PST)
Date: Mon, 3 Mar 2025 15:33:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <luceoscutum@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra186: Share policy per cluster
Message-ID: <20250303100306.rwaosbumr7omcqce@vireshk-i7>
References: <20250216160806.391566-1-webgeek1234@gmail.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216160806.391566-1-webgeek1234@gmail.com>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6hSR2fHrzG491
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741714759.4619@5QoRDpppyQo262nZm91Qnw
X-ITU-MailScanner-SpamCheck: not spam

On 16-02-25, 10:08, Aaron Kling wrote:
> This functionally brings tegra186 in line with tegra210 and tegra194,
> sharing a cpufreq policy between all cores in a cluster.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index c7761eb99f3cc..c832a1270e688 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -73,11 +73,18 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  {
>  	struct tegra186_cpufreq_data *data = cpufreq_get_driver_data();
>  	unsigned int cluster = data->cpus[policy->cpu].bpmp_cluster_id;
> +	u32 cpu;
>  
>  	policy->freq_table = data->clusters[cluster].table;
>  	policy->cpuinfo.transition_latency = 300 * 1000;
>  	policy->driver_data = NULL;
>  
> +	/* set same policy for all cpus in a cluster */
> +	for (cpu = 0; cpu < (sizeof(tegra186_cpus)/sizeof(struct tegra186_cpufreq_cpu)); cpu++) {
> +		if (data->cpus[cpu].bpmp_cluster_id == cluster)
> +			cpumask_set_cpu(cpu, policy->cpus);
> +	}
> +
>  	return 0;
>  }

Thierry / Jonathan,

Any inputs on this ?

-- 
viresh


