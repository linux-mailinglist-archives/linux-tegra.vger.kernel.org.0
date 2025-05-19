Return-Path: <linux-tegra+bounces-6968-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A1ABBADF
	for <lists+linux-tegra@lfdr.de>; Mon, 19 May 2025 12:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA15A16D239
	for <lists+linux-tegra@lfdr.de>; Mon, 19 May 2025 10:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7312741AE;
	Mon, 19 May 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cq/7wDP7"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B321FF61E
	for <linux-tegra@vger.kernel.org>; Mon, 19 May 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649850; cv=none; b=qxNHfKcsRm7F/VRW2BJivnQF3uOG7q4Q8E0iUhEyL3USKu+VeVojz5PgWblMmiDaiQsnQtTWs9v5gA4sEqBWfcMIFsQB6dAea80yMoPUzxEH5CiwBqPwVU0D0nG4klHVPJFoDWXuIAmaIOJLgFDdcNKkiS4xraOn37ty0V1dSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649850; c=relaxed/simple;
	bh=kGZApSmsqJ8FNloZKAWaRm5Et6mAG5BJUOLTz4KMwl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIMOv2xC8uU2DZsiVEm5Qiu5vTO6sjSMyO8CM8M6AjHOMPPkg4PfjEqnmarFRz5BnaoPZujCdZHeOApAyZcxnOOo3MyH1dv3rJlutPIuToRRXUGLNMWX0SHV1EBl7qybzikwSkxeuwh3NYZdU4TDPnYwE8/4Ki6Cd5GhRqRZnWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cq/7wDP7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-879d2e419b9so3468440a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 19 May 2025 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747649848; x=1748254648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2boHRW0tDTKKABf5lEFG75r/QTlyWAxlLMkN8E6Z4vI=;
        b=cq/7wDP7hD7YPKSF2bUnj7fEhZGR+HfkQjxgcl+/qT63Rlh6RNe5m7EgPaZtRmwR9+
         g78d1GvcMFIqo7YgNoqkh8ilKmiaR8m/F5gbkA+fk46crPtR6f8yk0Yjdh+W8LMAsLb2
         wb2PaCEEEVJU2r9lUefcP2haB438ZxAep03x6u9UlugIKPMweypLL5SQEamtd8q9ZZnA
         4bVGRD01eR82n0tbNn5lIlnno2orOp9hPFoY7x3v4Djg2ooFuMGJNTAiQvxvcR+4344b
         zqheTN/ejkOLRYM0H8usJjuusm2TJxQs6RGdAaYBow3NGbeG0cWeVGfe7TsJRU0wEujk
         QtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649848; x=1748254648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2boHRW0tDTKKABf5lEFG75r/QTlyWAxlLMkN8E6Z4vI=;
        b=Wx51OUCDvdSfz/NZpPZ6tmtdPd8slOJrDvpQD/xlmAjdzgv4YVtN/gHg/T/0IHuMwK
         antdpOVGJT0zY4RwwEQ0rHflRtjbO7YV4SzdolyA71CraqF+mjWbcK+lk+RrkfnWCVgz
         sx6ykpm3OODPMxp7x1hGl5AiKt53KLcKvqXRSSrAHhPmknOjUKD1Pa3sxXNLf49gUMiM
         paN2Vk0dlerUkwBeqNbZBea4lBF8viu8CwbTlTqXhYvqVqns2+7V04vYTFvLC+NOkG8b
         FUIvY1n00xIcYvvWyVOS7HbsDYibzZe9iXXF/x4hkQBRXg2MwaKly713FQK1T8dN9VXn
         SUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnyGHED/B/4Y1SBsGl0IGk9n4q0xFEqU2CwNY4u5UIXpLBbvwC1JoEMcwitGUJhnG0sZD47l/KaK2Kog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBidbgP+9BxrqqluQg5gIKYZGPu/f0pSH7kiXoyU9Zyvby9Cf9
	NmwW/QqMBQeW/0O0UQ8ixTSANk5n/MFnYXKg6SFgcOFrwW7kFC3fKMvWlUxozSwHtQI=
X-Gm-Gg: ASbGncu0EZ53PhR5GESgT9YwVBp6DzrK2f0cyru588cG/Ba6fwNZxHsf6CkTkzJ8f56
	47+oigFt5VvQBByEn3t3Yn4Df3dhNmNzlioiWo0BF+wDlZ7eJD2f+ozGK3MKxDhTVott5hr3VEv
	m+Kg5uUw94PvEBQWXwmnd1j3CVZTvQhZvfKOUJ4tG0E9oIDCWenzNuhXKKGc2b8zRoBezXVSi7t
	EVA6+JaYydwnNqU9PtCxN2joB654kaDn5hfoh+sjA+iLnn6SI0JPb0/nAwtdApeBJBcPL3deYrd
	by1eeokdyu24ge+z6NRb0nCA96MJj82lkmUYQ6jLJMcYqTUN9ybm
X-Google-Smtp-Source: AGHT+IEhCTAYxf2Bo20tqIdppUI7vimjOl158zpzlgDenffyAtRSk7F0NETM1YiKj0O0xkG784yPvw==
X-Received: by 2002:a17:903:2449:b0:231:c2e8:89df with SMTP id d9443c01a7336-231d4535a98mr192661745ad.28.1747649848139;
        Mon, 19 May 2025 03:17:28 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed4ecfsm56201355ad.234.2025.05.19.03.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:17:27 -0700 (PDT)
Date: Mon, 19 May 2025 15:47:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: webgeek1234@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250519101725.k644wzizjwygtwa7@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-1-d142bcbd0234@gmail.com>
 <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>

On 09-05-25, 12:04, Jon Hunter wrote:
> > diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> > index 514146d98bca2d8aa59980a14dff3487cd8045f6..bc0691e8971f9454def37f489e4a3e244100b9f4 100644
> > --- a/drivers/cpufreq/tegra124-cpufreq.c
> > +++ b/drivers/cpufreq/tegra124-cpufreq.c
> > @@ -168,7 +168,10 @@ static int __maybe_unused tegra124_cpufreq_resume(struct device *dev)
> >   disable_dfll:
> >   	clk_disable_unprepare(priv->dfll_clk);
> >   disable_cpufreq:
> > -	disable_cpufreq();
> > +	if (!IS_ERR(priv->cpufreq_dt_pdev)) {
> > +		platform_device_unregister(priv->cpufreq_dt_pdev);
> > +		priv->cpufreq_dt_pdev = ERR_PTR(-ENODEV);
> > +	}
> 
> So you are proposing to unregister the device in resume? That seems odd. I
> see there is no remove for this driver, but I really don't see the value in
> this.

This is the failure path and the driver is trying to disable itself
here. Instead of using the disable_cpufreq() (which isn't designed for
this usecase), I suggested removing the device itself as the driver
will be unusable after this anyway.

-- 
viresh

