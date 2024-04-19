Return-Path: <linux-tegra+bounces-1761-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E468AA86E
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 08:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E86F2835FF
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 06:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6810D22F19;
	Fri, 19 Apr 2024 06:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYVVByH6"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72E883D
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713508130; cv=none; b=FuiV3cYb9bMODAXdvSt3oqlbyoNyEZBNim3LTf2mCK2ldEjFcpc+h1deM4ACD1VEoHRl88ifD8+EGX9xn/uqI4UCoCOWll2/gKasggkRPZWp7hr4+N2hp7OY3hL8BBOCv9qaqZWtdaR3SXW6080OEllGDHarE/lq7SBXtWrK/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713508130; c=relaxed/simple;
	bh=WKkdIjjJd5AwfMBglOssEINqseYjTUuL5UgymD4croI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQv5ASC8o9ZPTgS4MbDGmTq23CVLw2c57NBRi/uf9QcbJw20+ROu997LPT3aEJMxB6PgiklKrbIjK1phez5d/beZ988NwB6U1+ZncB4sVJT4TMgSavxefPeEYtwp5xVLo9VPqIerD+az+e4vXnwUsclF6+ugtzkejlxrrFU/ouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYVVByH6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso1395555b3a.2
        for <linux-tegra@vger.kernel.org>; Thu, 18 Apr 2024 23:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713508127; x=1714112927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvSTBBH3v6roeXx5/W42r/UqmZ0hAwtViWz/IKSvWRU=;
        b=fYVVByH6WPCV8/K85Z/NBuiOiwbCMeRHof50sACsEuzo5wyrq/tTlILw4hvHo7UTjM
         SRspFUWkzjs7uELrTcvOZSDm6T9GYELqmkq7dWT5tvFhHkhMGXAc3tL0Z8MmMfcX+2P3
         74L7kBRecYZVmfRwzwYL9or+Yhwz5V51cX/RmKV9b6gLF4reG+tO0xlXGxoyUXK+mPxo
         Fld4SuCa0nv7mZ3csbf80YW/WYI/UGqk9I4B4sSvWaZnU2YcVFXY2dJtXroauS0dCvJd
         L1rWK8nhlrJGaZro8kRjCu0dlmhcDZS6HroXfcPx/u1xodnDwjB6OakQxASExrAvbJXe
         XDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713508127; x=1714112927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvSTBBH3v6roeXx5/W42r/UqmZ0hAwtViWz/IKSvWRU=;
        b=xCqiUuFmTgNnfakgDXxU64VeGajRoCV+qIswhDBN87ONs5sTNen1/ySpVQYf08N90c
         nOcKkI/KHoZAKTP0nKODkEHA7nwV95ibvd1MD0rFl7MCgXVtFXtZwPRC76ICXB1aDRcP
         uypt2Q4bsO+NwMoK9hyQNQwpW0a4XUxeoIBIHaoY9S01X5ru0arKPhv/i48XGFWQRH13
         Ih3P7sazXyCi04sMfN6XNlAoBXWE3aeEIK8F+KdS2G0JLBx+sBWBkWDfc9XpNQc5PUdR
         a32yDYW5ZKcXAfs+GSd0gmQFZfNZPAvyEeU63TW8gPvjmgWMFtZdrr2qY+X5bf4WUIaZ
         LCww==
X-Forwarded-Encrypted: i=1; AJvYcCXkcmEarJeGbaxxmx9GMJTAR1s1K8xophvED5J5CotCMtsYNVVxGpB1NNM03xTBBtAUb6AcNuwVFtJyJis1TOxKfJ4hF66fOhtZpqw=
X-Gm-Message-State: AOJu0YzTxIbPgJbx5zzRsigDtVFADgJi/UiZizfBwpok1oORobjGIflr
	0CZglasZPtE/HM8L4meSaiHliNY+YF7qerN3zb4R5CtGPQq0x52i4iVefggULhc=
X-Google-Smtp-Source: AGHT+IHy6niLl/88ecXlZ1L49JJ5pPAijtlXeB8NEQg0SKtgaVRWocf5WffnSjz653PBAgOikR70LA==
X-Received: by 2002:a05:6a20:c70e:b0:1a9:c214:b7d with SMTP id hi14-20020a056a20c70e00b001a9c2140b7dmr1440687pzb.2.1713508126697;
        Thu, 18 Apr 2024 23:28:46 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id m20-20020a170902c45400b001e197cee600sm2595636plm.3.2024.04.18.23.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 23:28:45 -0700 (PDT)
Date: Fri, 19 Apr 2024 11:58:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Julia Lawall <julia.lawall@inria.fr>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] cpupfreq: tegra124: eliminate uses of of_node_put()
Message-ID: <20240419062842.dc6tzssbcqdtdfi5@vireshk-i7>
References: <20240407-cpufreq_of_node_put-v1-1-2c8889d4935d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407-cpufreq_of_node_put-v1-1-2c8889d4935d@gmail.com>

On 07-04-24, 22:15, Javier Carrasco wrote:
> Make use of the __free() cleanup handler to automatically free nodes
> when they get out of scope. Only the probe function is affected by this
> modification.
> 
> Given that this mechanism requires the node to be initialized, its
> initialization and the value check have been moved to the top of the
> function.
> 
> After removing uses of of_node_put(), the jump to out_put_np is no
> longer necessary.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> This patch is a proof of concept to remove uses of of_node_put() in
> cpufreq, which can be replaced with the clenaup handler introduced with
> 54da6a092431 ("locking: Introduce __cleanup() based infrastructure").
> 
> This change provides a scope-based cleanup mechanism to avoid potential
> memory leaks that can appear if of_node_put() is not used correctly.
> 
> The patch is based on the latest linux-next tag (next-20240405).
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

Applied. Thanks.

-- 
viresh

