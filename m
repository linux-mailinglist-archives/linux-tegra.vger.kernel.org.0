Return-Path: <linux-tegra+bounces-5144-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3AA377CD
	for <lists+linux-tegra@lfdr.de>; Sun, 16 Feb 2025 22:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA85188BF05
	for <lists+linux-tegra@lfdr.de>; Sun, 16 Feb 2025 21:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F1F1A317C;
	Sun, 16 Feb 2025 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="QbRGpGXT"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-65.smtpout.orange.fr [80.12.242.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B74C70;
	Sun, 16 Feb 2025 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739741634; cv=none; b=lt/+IVuhW1QlCEglpJsBFrYbfn8eI2LVUBEpoD/5BDUSRzuISS+zfFgn6BfAZh/7TFML6p3BNTDYxgrcMh/1kCvWhkPeAhT8oF8nMIWsAB2wt/g3DsBqI4V0tzKiNTAL4Kaahswtsm0e9wmDK+E6WcBAoABJvUm0RlH3mxFReyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739741634; c=relaxed/simple;
	bh=7guRH1aGM8Oh0aNzrHu+kgdJ26FPwWdwt/A0ZwzFSsU=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=p3RiZj62dNmBTgMyenTtSMazRqPOrXn0j/FbxKwjhwtOS3g/4yHGe/uQ1OJsoCOxF7lTXPGhAQn9gPu6wsmROKGnZ4ocFOgE1zS/QKQqBhvLOJA2McHDVX+XZPI8ksnIVxWmJuBVfnmzEu8B4fiyvPTXPNZJU8wEvUl9zbkUc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=QbRGpGXT; arc=none smtp.client-ip=80.12.242.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id jm7qtro1wBmk4jm7ttKqTm; Sun, 16 Feb 2025 22:24:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1739741076;
	bh=0lA5RpCI8RgDLbiFA6kjdlW7BOO4zRImL2WUGm+cZio=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=QbRGpGXTEERSgWydbfK8F3S6nB4XFi7sMpQThiZi3L0G3x1FhjjcK0mAXUB2juw5s
	 YyEblB6RihQXQQvLViMLCCLKHNKSYHbfoUcl8AzKes/6VASSCpdypOqSC+xeB/O3CK
	 7jlmGxNCSH0zaZhUbJxpIcJxvRDPiEpC29zIVdCFUJt6on8Mj1pZvahJOlO2hAfQ8s
	 AxgeS98Wnw7hMXdkq09/79Z9iP3ujUsk+rHW7sKzpnuHhUIjICrq75p1JyZl+eKqWJ
	 nQYSnL89h0Yh5fzw+gb6eOdiHpgL5XpZOxn0/eq2F6yIsOeQo1AwUtaiYn0L4lu2tR
	 GGTjVF3PkqJmw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 16 Feb 2025 22:24:36 +0100
X-ME-IP: 90.11.132.44
Message-ID: <b0af7103-882d-41ec-8b15-7c8955e1b77e@wanadoo.fr>
Date: Sun, 16 Feb 2025 22:24:30 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iio: light: Add support for AL3000a illuminance
 sensor
References: <20250216162721.124834-1-clamor95@gmail.com>
 <20250216162721.124834-3-clamor95@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: clamor95@gmail.com
Cc: andriy.shevchenko@linux.intel.com, arthur.becker@sentec.com,
 conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
 emil.gedenryd@axis.com, ivan.orlov0322@gmail.com,
 javier.carrasco.cruz@gmail.com, jic23@kernel.org, jonathanh@nvidia.com,
 krzk+dt@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 mazziesaccount@gmail.com, muditsharma.info@gmail.com,
 perdaniel.olsson@axis.com, robh@kernel.org, subhajit.ghosh@tweaklogic.com,
 thierry.reding@gmail.com
In-Reply-To: <20250216162721.124834-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 16/02/2025 à 17:27, Svyatoslav Ryhel a écrit :
> AL3000a is a simple I2C-based ambient light sensor, which is
> closely related to AL3010 and AL3320a, but has significantly
> different way of processing data generated by the sensor.

...

> +static int al3000a_resume(struct device *dev)
> +{
> +	struct al3000a_data *data = iio_priv(dev_get_drvdata(dev));
> +
> +	return al3000a_set_pwr_on(data);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(al3000a_pm_ops, al3000a_suspend, al3000a_resume);
> +
> +static const struct i2c_device_id al3000a_id[] = {
> +	{"al3000a", },

Nitpick: missing leading space after {

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, al3010_id);

