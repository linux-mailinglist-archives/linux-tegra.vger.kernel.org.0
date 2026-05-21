Return-Path: <linux-tegra+bounces-14610-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJYrCxvWDmr2CQYAu9opvQ
	(envelope-from <linux-tegra+bounces-14610-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 11:53:31 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0695A2B77
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 11:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AA6F307349C
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 09:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776AD37CD2E;
	Thu, 21 May 2026 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="RpfAUNgw"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B137C92B;
	Thu, 21 May 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356888; cv=none; b=jaSZ2PIM8gw9iblT8coVRBubUgjRFoGA27iKS6yA2QVjKsjCg+8A5hzzCCce1VtelABhTnOTFP1VCyUvQjFjxRDGR4Qx8g81WsgV9nJpOfaY99a6PH7UOPSV5OnkxkGk9RojCbIg2OYx0fGuvh1sEM68FdevJwPIey5u+/d0hyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356888; c=relaxed/simple;
	bh=jyxPgU8dof0LV1J9j54Q2ixLGeeQrA7AybB5xE7Yqsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUlr09rD69r9C2gyD54v7e3DNeLDOC6fo/YbNX5LPllBDEL7q2ZC7+xQqgBygx2QQr9JswDht7eh20EGnG5cN1uUdMe214eGsMdX0HOnHtcvIe+AnLzOWOgnOb+NPkJ9HXu6Gz3gxyv/eWiYjWjR1YyM3CAZYjJ9Z4z7MU7sdVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=RpfAUNgw; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id BA9A06002999;
	Thu, 21 May 2026 10:48:04 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id CsHTc0whN2v9; Thu, 21 May 2026 10:48:02 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6FEEB600086C;
	Thu, 21 May 2026 10:48:02 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779356882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3SJwH14gWblsk/bE7J06KsarJhv61Jks87wu8Zo5Zo=;
	b=RpfAUNgw5fB3ERA1e+htSwHpxxpyk+KpVPABzNulM98px9rfpjxaDVjRWaFhj781X1a2eq
	leVhcgQCYKFFNyGRRLg++Z6bzoXO783UjxGeTlnPG4XoeSvEk7Z7AlXr/3hRAyr33QUel5
	jdV7I3DcT6GfBKR/xZWNmskRl1JPpIXR+uS65jyCwbo+LUvQlq/gAhDphy4oZHCvp5vLiy
	LwxaWgLjpwNv1a9YqpVywElhJrtNCMnBIc3mDB77lf/3nLiOBdYvEGzYvXVAqZ7zyjxz9E
	TRM6hLjh6dBR4JuLyF7gG81m+3660UZFv7MvdpKf6MYqkPai9b8uCa/sn+og9g==
Received: from [192.168.96.1] (unknown [89.214.153.114])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 902643600A2;
	Thu, 21 May 2026 10:47:59 +0100 (WEST)
Message-ID: <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 11:47:53 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
To: Lee Jones <lee@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <177929432727.2891971.15568098895295536822.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tecnico.ulisboa.pt,quarantine];
	R_DKIM_ALLOW(-0.20)[tecnico.ulisboa.pt:s=mail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14610-lists,linux-tegra=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,tecnico.ulisboa.pt:mid,tecnico.ulisboa.pt:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tecnico.ulisboa.pt:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diogo.ivo@tecnico.ulisboa.pt,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C0695A2B77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lee,

On 5/20/26 18:25, Lee Jones wrote:
> On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
>> This series migrates PSCI and MAX77620 poweroff handling to the
>> sys-off framework and fixes shutdown on the Pixel C (Smaug).
>>
>> The first two patches replace legacy pm_power_off usage in the PSCI
>> and MAX77620 drivers with sys-off handlers. Besides aligning both
>> drivers with the modern poweroff infrastructure, this removes the
>> global callback dependency and allows multiple handlers to coexist
>> with explicit priorities.
>>
>> [...]
> 
> Applied, thanks!

Thanks for applying the patches! Just a question and an observation:

  - I'm assuming you were ok with merging [2/4] despite the possible
    deadlock since this risk is already present in mainline in the same
    form so we're not actually making things worse, is that so?

  - The observation is that the comment about overriding PSCI is only
    true after (and if) a reworked [1/4] is actually merged.
    If it isn't then patch [3/4] is actually working around another handler
    in soc/tegra/pmc.c where a handler that only does work for the Nexus
    7 is actually registered at FIRMWARE level for all platforms that
    probe that driver (I will send out a patch shortly to only register
    the handler on the Nexus 7).

Best regards,
Diogo

> [2/4] mfd: max77620: convert poweroff support to sys-off API
>        commit: 1ada6d7f88063dd6fd92d74d0b803875b695fe01
> [3/4] mfd: max77620: override PSCI poweroff handler on Pixel C
>        commit: ea3f90bcc8524c6d514f6b8183cc202b79b082be
> 
> --
> Lee Jones [李琼斯]
> 

