Return-Path: <linux-tegra+bounces-2863-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1591EE30
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jul 2024 07:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C43301C223D0
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jul 2024 05:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB543D978;
	Tue,  2 Jul 2024 05:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+/6Qg7r"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E72D02E
	for <linux-tegra@vger.kernel.org>; Tue,  2 Jul 2024 05:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719897331; cv=none; b=q/idx4VqgRmE3+iUK2gxDcIVJkjDLy8vsIhv5SOKZbpODv4sKbWyB99gUuCiDMPL4IFZP+uLT8YNpxVacz8AiTKro3lQveAR+XXl36MxDItbaHAyasNo8zXCk5IXideDPsZd60VxZwy1xfIXNla/4fKLUzTCcJfbMHYiadDg6XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719897331; c=relaxed/simple;
	bh=gwUHLMvROBtiR4lWNGAYwsWo7SWaaTdIfS35b+n6CSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCFY02JiFBq1L8tnoJzd7PHBpiHN7reuWMNnj1biKDrdBlhKlhq45b3cXzM+pIO7CXl7i2Jqg/kqQfa3h5P6aMjMTJiwzjzC0s5Y5v9EhTIdC5VmDt1wsShPB6uw7bdCSJoeflYqg3uCo3t/59Q3tSVvtmQr/tdUfqLqud+RapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+/6Qg7r; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-726d9b3bcf8so2611414a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 01 Jul 2024 22:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719897329; x=1720502129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSVGA1NqzD8+RwsUi1pxJNxEDfClGTBrTdKnbsjw64U=;
        b=g+/6Qg7ryDXx7+kvz8/YDqFcaQI0fXoH9suMQV0UkGd5IEuO8HoYpq26XnoNF1Iwbq
         bmphLPC1lEbt3IfuYJ0q5MAUX6Y33MoEPAdFOHOZIQa/miQGrvyTxS9NbM0p1j0coT8I
         zq9FXqEGj3ySUo3I7sfMZ2aL9wOQYQ2EfEho99+R8aWvQOd2rwTJMfeK0HJpWNzFUncV
         UdRefSYMm6SqAch9AyxV08LjknqpN/OPUhNrcpLPxv+UBAhNhdxAqHyhB6dUZYzoEsC7
         1Jcx75IIE2kBiIy0Z/1f1uZrPBVPtXPsPfbZbIMISme3qNnXHHUvElu+G5xgIrfv+tgC
         MLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719897329; x=1720502129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSVGA1NqzD8+RwsUi1pxJNxEDfClGTBrTdKnbsjw64U=;
        b=HO0Bvxk6M1YWVS0Iz6zEufkvirhqzR/F5ARIjqBymQzLN6M4z5FhNQX7keKDFjKgsJ
         FbdSkaHdq/gMAzL+soS75Mu8TeH8zZPj5cbImjIYagpwk3UKe1KJ3eC375nubEZKsO4h
         S5vyrx+41xLESGxDd22DLPwzakLPnTWX8m/5NzjkyPOTMg1JzofqK6V6RYiVgZTtrzsM
         M5o0z7UolgVMb1T/k+3F3E2cRqY3Al4/K4B7ZmRkVDUMZdfpyGrhSw7HF32agGTme2U7
         fBttRpQOMz/K+gmlJln2KVkb8nDZedGkzwI0JWmjiQLQWcGMt61kOv5o3MijjSkpDafJ
         yUkA==
X-Forwarded-Encrypted: i=1; AJvYcCV2O01q1SUH3laCys3BYgzZf8+ITMJOzKpROovyFsCfSO8tzDN/KCSvlDhMye1POugw5j+NsVdEcMqCOqzrznHeiPxBNDfNAB+FEhg=
X-Gm-Message-State: AOJu0YyV+hbYE9Jqbkvyfi10+z3Aq73JezCsE/oHfMPBheARadA2B+Cw
	MRzJgT5HO8qHcGJ9cBc430FoFTOP2sxHmegJTNZ25tjPqBeTVqFQOmhX9WQCG+M=
X-Google-Smtp-Source: AGHT+IEm7OBi3HKDMeGDVx09VV6N1pDpq1JjC1MRP7keTE059spnR/JoI4AduNHYTeO/MMUWdGUrcQ==
X-Received: by 2002:a05:6a21:3983:b0:1be:e1f9:a33 with SMTP id adf61e73a8af0-1bef610d0femr7432248637.32.1719897329448;
        Mon, 01 Jul 2024 22:15:29 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad58e84d7sm61170145ad.74.2024.07.01.22.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 22:15:28 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:45:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM
 domains
Message-ID: <20240702051526.hyqhvmxnywofsjp2@vireshk-i7>
References: <20240618155013.323322-1-ulf.hansson@linaro.org>
 <20240625105425.pkociumt4biv4j36@vireshk-i7>
 <CAPDyKFpLfBjozpcOzKp4jngkYenqSdpmejvCK37XvE1-WbBY2g@mail.gmail.com>
 <20240701114748.hodf6pngk7opx373@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701114748.hodf6pngk7opx373@vireshk-i7>

On 01-07-24, 17:17, Viresh Kumar wrote:
> What about this patch instead ?
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 5f4598246a87..2086292f8355 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -1091,7 +1091,8 @@ static int _set_required_opps(struct device *dev, struct opp_table *opp_table,
>  		if (devs[index]) {
>  			required_opp = opp ? opp->required_opps[index] : NULL;
>  
> -			ret = dev_pm_opp_set_opp(devs[index], required_opp);
> +			/* Set required OPPs forcefully */
> +			ret = dev_pm_opp_set_opp_forced(devs[index], required_opp, true);

Maybe better to do just this instead:

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 5f4598246a87..9484acbeaa66 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1386,7 +1386,12 @@ int dev_pm_opp_set_opp(struct device *dev, struct dev_pm_opp *opp)
                return PTR_ERR(opp_table);
        }

-       ret = _set_opp(dev, opp_table, opp, NULL, false);
+       /*
+        * For a genpd's OPP table, we always want to set the OPP (and
+        * performance level) and let the genpd core take care of aggregating
+        * the votes. Set `forced` to true for a genpd here.
+        */
+       ret = _set_opp(dev, opp_table, opp, NULL, opp_table->is_genpd);
        dev_pm_opp_put_opp_table(opp_table);

        return ret;

-- 
viresh

