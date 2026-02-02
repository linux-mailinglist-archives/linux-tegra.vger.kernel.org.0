Return-Path: <linux-tegra+bounces-11788-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F6tFyzogGleCAMAu9opvQ
	(envelope-from <linux-tegra+bounces-11788-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 02 Feb 2026 19:08:44 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC323CFEF7
	for <lists+linux-tegra@lfdr.de>; Mon, 02 Feb 2026 19:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80694303980A
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Feb 2026 18:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B830138BF69;
	Mon,  2 Feb 2026 18:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMPagI2B"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBB38B9BF
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055313; cv=none; b=YULTKgw89msnD1rXNE43Raqwcs+ZhPbX/Je9MQhivncyAPFpG6i6eNnPU0kq1+OSrf5hsDU0U0Npy9/uIoMFh4vdi4Js3Wl3Gkil1nSkdoKBVgGETnqC+KDhB7lxY5huwOhjUt1JpcVsd5vmD4kulcp81/jZRuoetRUzPuNHAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055313; c=relaxed/simple;
	bh=hTtgkhOWMpNlBXr1nPDMrRziEVVQp/MwMYD4QueQQpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4Vd3NGPAhxxrWlVDcmOXEk29V0JDFu7yrSP8eY5Yo1F8YJxxvJXKElQnM+Rzm6og51rWF7H7BveJn75mYjhOUOwIgQ8tNDz88s1do/b3OXDesaCRB8Stp6rYOqFvNKaR/L2Ir7SWWsb5+QsnypJ3N69nHNrw4TeWr6nbJ6+MZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMPagI2B; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b7c2614f7so4385242e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 10:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770055309; x=1770660109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFABA++ZvkbyuC08URcMyM+fmFe85L0vnPidtUOeUZA=;
        b=jMPagI2BaSTgwApEPadMupRuXGmZULICw2dkfzBIlw/3Y62rJKorbZZdFdP8vQLPpT
         QJ79Q4qLJkKZ6rxEbQAp5yJTJdgGR3sv8hSnIWK2Z/tfor2To5n4bgxEU7v5SuqF0POf
         24J1wQluxfgfE0JT2AV7wZFdwtGyiJ25BuG3CLXth/sauSqYzMmic2EgrlKjSwErQK0P
         aygK5F8dzS06vHtfWn6JmAL43U0nc83sn49e+Lg7RUr3sJ3naSSTF7qA2qdNwP9xib0c
         qSJA1tacedVLWbXYwDwMjbUQOKh1G/pEYLTFNwKUFn+FYjDK+92EFlrSR4Jj1FC9G8as
         +1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055309; x=1770660109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFABA++ZvkbyuC08URcMyM+fmFe85L0vnPidtUOeUZA=;
        b=HGs1l/isvFVbO0OycKR6bEK3WhQ0oU+EQv8uI86vId6InVWJmffvPVIVRWV0k4ZBbq
         rUCZAoD22seBf1dMWRGUGEOgexHmmDmpm0+aBdxkkLhKF2+uICSUWQOa5bFfwl8iBbXw
         //oXsP4lbOD9HzrPFl9nOB4zZvnnV7WiRTmMDidozVjZaLQauo9wGNaecu9cgkDB7noc
         usHDekVax/DRD3zARBDnhPwtMYtD9qmy9l824+usQ8BydKAAvYeh8N2SenK3svTnXuwd
         m2yEYku0Yrb7HxPxec9JRc3RwdcWQiAUaKpeiwu4zX5ykFJKpv7n3zvGiGRUxrnf3u6O
         skKA==
X-Forwarded-Encrypted: i=1; AJvYcCWSvq82RZsd+XgIq8yYQXZiBxisgcSXW/v1I6O+oaFDrEZWho4DLK/luEI+aVWhZGB5CcvwkihP+GoM6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwViJc/ZVZE4GDs/0pC9ngcRuRb2EBsoF9Nt1LvOt4B5UMqRF8c
	jUfJsFcFqb0or7KMaA9UL3w6LMyZfGxopmgehWsCKm1m6nv0XpojNO3C
X-Gm-Gg: AZuq6aL47VYPaTAAmeKMT/h7K1wmtf65id1FJZ+F2mZWmcTQie/EY/2McVich8Lrmxi
	OwWNpNMGzt7znbPXZaqTzh1OBoKDmQeGvPlGktUdTAEGyelaiGICYw/miRxZLKTyWM9iIahv9B7
	BFCDmHIeabRxpwHYvxaogxot1SRENI0dfx2PdIdGnWXYfQKSphd5oROCqREthSo05z909q236h8
	dS9pHFv6jdSR/O0ZFMYhMCI28qtLhAGzFjYxGVSM4suz0LbLwFg5gktYlyDgM8W/7hufXIKhdJt
	YDJ63zsgCgmq+4A346+ANyY1xm/jdJXwOVqAowXeVujx3HciL1uRN1prBEdTbkYHy2YjaSUvMrT
	v1zw3icfh4GfZztwrusv2hEAuUQ1Y6I/06kYZkM0ds/fo07vIc9NRQeo4dcgfmPA9Fbvj1C69a0
	BQZDCdH+utN2WgTjfr+5Y5BvBE9bGXgInK9GhVzDssrXAoUezL/xkbcmtb1cMskhRRVMR8Zg==
X-Received: by 2002:a05:6512:4023:b0:59d:fd1d:ddff with SMTP id 2adb3069b0e04-59e164304e0mr6191268e87.45.1770055308708;
        Mon, 02 Feb 2026 10:01:48 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe? ([2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bdabesm3761777e87.93.2026.02.02.10.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:01:47 -0800 (PST)
Message-ID: <aabfe8bb-cd04-43f4-b0e5-07aca86c3ae0@gmail.com>
Date: Mon, 2 Feb 2026 21:01:36 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from
 utmi_wait_register
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202080526.23487-1-clamor95@gmail.com>
 <20260202080526.23487-3-clamor95@gmail.com>
 <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
 <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11788-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,nvidia.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC323CFEF7
X-Rspamd-Action: no action

On 2/2/26 3:14 PM, Svyatoslav Ryhel wrote:
> пн, 2 лют. 2026 р. о 14:05 Sergey Shtylyov <sergei.shtylyov@gmail.com> пише:
>>
>> On 2/2/26 11:05 AM, Svyatoslav Ryhel wrote:
>>
>>> Return exact error value from utmi_wait_register during HSIC power on.
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> ---
>>>  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>>> index 3a7a74f01d1c..6173b240c3ea 100644
>>> --- a/drivers/usb/phy/phy-tegra-usb.c
>>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>>> @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>>>       struct tegra_utmip_config *config = phy->config;
>>>       void __iomem *base = phy->regs;
>>>       u32 val;
>>> +     int err = 0;
>>
>>    This initialization seems pointless -- the newly added variable gets overwritten
>> by you later...
>>
> 
> So? let it better be initialized and rewritten then later on catch errors.

   I'm not sure what errors you mean here. To me, it (contrariwise) seems to
mask the possible errors when you forget to set err to e.g. -ENOMEM before
returning (when adding a call to kmalloc() or any other function that doesn't
return an error code itself)...
   I'm pretty sure gcc will drop this initialization when generating the object
code and (what's worse) the static analyzers will trip on this code telling you
that the value 0 is unused...

[...]

MBR, Sergey

