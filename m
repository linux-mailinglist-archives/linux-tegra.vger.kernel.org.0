Return-Path: <linux-tegra+bounces-6989-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E0ABD514
	for <lists+linux-tegra@lfdr.de>; Tue, 20 May 2025 12:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD77C7A61CE
	for <lists+linux-tegra@lfdr.de>; Tue, 20 May 2025 10:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CE226B099;
	Tue, 20 May 2025 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nKEAvyTn"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16A270EA1
	for <linux-tegra@vger.kernel.org>; Tue, 20 May 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737189; cv=none; b=Mm5vBjD/8hfRL3HYTcl1C1MVUj4O0WTEIVTOyCwnYg4UJcSl/tfFO4DnDQI7fHuVuGXBTzBp48ptjhMQZiNX/C3fqqju5uEtkGP8Fcj0p5LUIQdT7nbQ2DQ+xSNDgfJa09oDQ1zbTIiRtBjLLuVVji3o46a4ItXkUsSKFLsCgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737189; c=relaxed/simple;
	bh=Ltw5M1lySmrMauSrqTCCb0ZHHbcTroNTLc7rS9O0Oms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ox2dH0XnnsQsZ53Uc5lQNVwvuyHeOYXsbyujuySYkefkCIDGXm2kpXYpiSWBSXiCQOBn7/0wIWB3O3KooDD2NVHaQuG+SvTY3Mmv7KBg+TP5fUKOyZeoSwggCa/41UJFGaPmyvbdgzma3RQmZNGmWdiD7MX0UBtC92krKOYpCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKEAvyTn; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso4591334a91.3
        for <linux-tegra@vger.kernel.org>; Tue, 20 May 2025 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747737187; x=1748341987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2kiU0hliZX3M+Z93vHD55Gq88AD3oRKFF0hgKdQy4o=;
        b=nKEAvyTnJCQ9CAKW2m8fgGQ78ddTxEiCCDkeGyAeNf5lq7PgtRcHt+CqEIqgWp6qCJ
         VnObKfFen6GZeVK4cYDIyYL9BhMfIXBsAkMbP/l5y98UXj1qnC++oT4veeN6o5VmGYc7
         ERj8J9JLAx2ZmC/FHohAfIcYayNitiHAZkGJKgKvWUB00fK+doJig09HQQJyJSPpyVGm
         V58qLWhYBtp4cA4BU3RpNhb3VHo/6LZ57qIAXSYz6C2muMrxbJ2WB5acQRQvyFoaRInq
         gl8z30Ubl6b3EDhGtnurGSr20hamNgudSLC+FaJ5njzdSrIDPpVEIZ1Yg1A1RXZ4xrIj
         TwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737187; x=1748341987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2kiU0hliZX3M+Z93vHD55Gq88AD3oRKFF0hgKdQy4o=;
        b=O/9iRdycweKyMQm3DOA0sFR2FF3YDMJEOIMIOTZIqfOkr6kUO0pIx4DUPJjNjD59n7
         iZtp1mbaAWhU6L5LhgfLuORz5VOPp3S2YL3N2I3iCZXNjnRTl8Hc3AElzcqiZdgxb79v
         5o1LcqdqSrwvPpCIz5ur603eWN+btkLWQ/5uxmYZwr8J/z5ATaarKcUGzH/me0fzqgP5
         OQljvPGpL2LUguV5AenKwl0rj/4l1pqmiOJ4U9PexeLAklfXlZROdPP8HciUJ5ftneS8
         dmsIeHAXJltCbA9q76/q9flwew97TOBtW89hlaSiKCCDRrsu45/T8D+4x29DvHxDBFkX
         bEOg==
X-Forwarded-Encrypted: i=1; AJvYcCVZxI6hGnfSmocdumjp7iaoIdYvHKp94j2nr/DEwCPlxy2T2CgCx1JKVlgku+TSa0gV1Fag4OTi+s6IQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysKYn9l2349EATvoogE/FpwKCNXVBNT2ArhHtCCF7mNbHxiefO
	UDnGMEF4y1HOiupak5gRw/ez6JDYqKbJ82je8m2jUL5m+7bg2T7JbYyOm2lwkPBHVQM=
X-Gm-Gg: ASbGncuLtaULF2QYNKlL3G0xBUadZi9VBNMcGXCCfVDMgQRec58gFnwHB5k/rtmwRNo
	kCJQD2APEsPIx5ttzurUj4C1Ct5ggQHT9gV9bUeXFzZXkO3lQmxzl64H00/LzY8RZFEgmeHTZuB
	VPwGLRW4rGqYGj+p9D+ozYXvTJlOih2XEk/57Fsh19Gnef4zlxdLKufufhiMKZgop8xuXusv4eW
	Dg6BqNUa54qplvOipkkMhcwosq3vuneKQWw5oFOmL1P7LlJzyJgiIFt+eqbCwZHBOkog/ZSEoEf
	81T8UeGMw51cJgMEnelFgkrpxv9pbOTSH/ykoDNeC1ForU5EZ3pC
X-Google-Smtp-Source: AGHT+IHm+zce6wVGhmj39um6VsmybhdOdhuKQ+lb+Ma5CrUm2fVpCacBPSaYFhoG1FApBOr61KuRzg==
X-Received: by 2002:a17:90b:48c6:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-30e8314cff5mr29948004a91.16.1747737187612;
        Tue, 20 May 2025 03:33:07 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm7772574a12.48.2025.05.20.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:33:07 -0700 (PDT)
Date: Tue, 20 May 2025 16:03:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Aaron Kling <webgeek1234@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250520103304.jfevon546rft2ncr@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-2-d142bcbd0234@gmail.com>
 <cd801698-d7cf-4e9e-aa01-5525f8687ab0@nvidia.com>
 <CALHNRZ_9tMi5iihyTsEuU4T72=oTQM6-rVhqozzLf9DiB_TpcA@mail.gmail.com>
 <CALHNRZ-pu9HUzVyR3-U=XZKFFZPnn5-DNLWPqPx6CSoW0dHMrA@mail.gmail.com>
 <bc0a4c75-df5b-4b4d-9c9e-a2c99d3f4f6e@nvidia.com>
 <20250519103749.falgd64ikkwkfpg7@vireshk-i7>
 <9a15ea89-5e33-48e7-8c75-b041f6832bc1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a15ea89-5e33-48e7-8c75-b041f6832bc1@nvidia.com>

On 20-05-25, 10:57, Jon Hunter wrote:
> 
> On 19/05/2025 11:37, Viresh Kumar wrote:
> > On 15-05-25, 07:41, Jon Hunter wrote:
> > > Yes and that is understood. I see a few drivers calling ...
> > > 
> > >   platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
> > > 
> > > One option, and I don't know if this would be acceptable, would be to add a
> > > new wrapper function in the cpufreq-dt driver for the above that other
> > > drivers could call and that would create the dependency you need.
> > 
> > Doing that won't be a problem, but I doubt if that is a better than
> > adding a soft dependency here. I personally felt that the soft
> > dependency may be the right way here. The cpufreq-dt file presents a
> > driver, a device can be added from any file and that doesn't require
> > the driver file to be inserted first. If the platform wants to
> > simplify and create a dependency, a soft dependency looks okay.
> 
> The only downside of a soft dependency is that this driver could load but if
> the cpufreq-dt driver is missing for whatever reason, it might not be
> obvious. Ideally it is better if this driver does not load at all if the
> cpufreq-dt is not present.

Fair enough.

Aaron, you can introduce a helper like cpufreq_dt_pdev_register() to
solve the linking here.

-- 
viresh

