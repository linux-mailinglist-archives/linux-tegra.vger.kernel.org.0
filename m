Return-Path: <linux-tegra+bounces-11977-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICKEB7wglGmKAAIAu9opvQ
	(envelope-from <linux-tegra+bounces-11977-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 09:03:08 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C91149842
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 09:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C725301387E
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533F22DA74C;
	Tue, 17 Feb 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3a+zUmU"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDF32D838E
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 08:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315384; cv=pass; b=qQ6Ce3yrYaXBdOt6LKyPk7SNe0RzpCNX/4ZpIveTjLf3tDl31F3y4J0bZbvrBRT6UyE63fSFCbwyssn1JZ5DFJX8FvFIkFtTl0TOJC6E9Mgfdyg+lmwh8kaWoeEvxMPq5w1ad+cNZb6NOei1ue6zPnIfIspvHD8C+14dVFMuqtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315384; c=relaxed/simple;
	bh=d6M6Apqz2BPqq2uuJdTJPs4qAtC3dU3FCX2IhxX7PJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPHS+Zp5UJsvukiogLhIQYfBMbdv/elPWApp+irBatnLgFr0vY4Er2N22jzqdTMaRp4etqrPvCVKzm7u5Rqz2FK9aeUfc4uybdbdo0XgPq2L1Un3CFMC81cTqhSC7auotZrAkmCpG71zmUMzG1eNCk1VgOIdm557Dhxy9RvJAC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3a+zUmU; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so2951429f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 00:03:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771315381; cv=none;
        d=google.com; s=arc-20240605;
        b=arq79dNURkaZ7cCt4Bi+zjecINICC9dxZcNANKGyAC0FOELzQLdbeZNQGIh68hnY/M
         FDGyo5+7wavhLA9z2WYRB9z7TalFco9FUNZAvbipThTpJl7/0RYsFWyb/gn3W5BncISX
         EBhNE/zgSYzL7oT3myuBrZnJByd6XJP6YL1Y7vPps2xO4GBwrMWvQJUktkpOYY3FIMLt
         Z8nwat3YSLXVwBfC+R3fsMveNjgWFPDRtMrjXt/mUSOlApGJXGBAMIIzKtBaDOqRUfIX
         bcD94RZLOwYqvwKXm8UeYgGn1FSrFTdIjIBemNhLxHheuIFNd5ESudmbtZcpqnsIYZCo
         5JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSmgW0cdIABiL/o92NBnxbcVSmBcTIIknb+79kdQRek=;
        fh=OUpCfwhlov214Jbz5OL/MzK2trAGfXA86WHoqqgh1Pg=;
        b=ZigPx3FdQePElJ8srp3yURbUm/4OsAWCPd9NVlF3VxBZEpEzowhGV1itmnOi0IObmC
         24kQO/rMDXv0yo3f6pj7qgPB4gaJH0eC8gOH03S6qDcWRdrjMedZlHyXGQ8hupm70EmB
         5P1d9A7Z0HPZv7WUXpMH0nO1vF/iSIm5Xi7lVVRJplUG2RZwxqVihA1ZsbDXZl37RI0J
         oGSTbFsLGuJ1KgdMPsXK9b929C6zq++vddsW9Srj6z2cPJ0RniCkaRfAZJo2OFAM9xHp
         InsfMPm8q9F92zgFoZ7GvgYNe24FpO/wX3caeiZ6jMOuzfV/bvY7UiARpn9jXPd61zVH
         F0EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771315381; x=1771920181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSmgW0cdIABiL/o92NBnxbcVSmBcTIIknb+79kdQRek=;
        b=L3a+zUmU45JDtfYHnFo4mHZcX0QIeHplx9GWQERACJBhFoEtcLkHmU/5tJxdw7DW9q
         b1GQtEk71nSQyiE/rab9mzY8+M7nmaANpwocFlXZoAmRZ5Ta6yu9ZiemqHPFpNcu8DsR
         c/XNcIxiCN/EAvGPy5QnRRobfkFXZ7jtqIO/uYWMC7VFNuD5r8yjJ1xSFlsVoLo7oaP/
         6OiDNcxYSlenoypD43RN7nShCKgmJHuApWrr0ysUSYi8xUEl1BXM5cRc2ck+AZ7wD/RI
         55+WzWQMiP7HmTqElVqaFMIK7EDMA7uI51cqnMiSnj5notR1TFPYgKxcaZCLbsp/92LV
         eLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315381; x=1771920181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSmgW0cdIABiL/o92NBnxbcVSmBcTIIknb+79kdQRek=;
        b=o5cgnSWrZhStu/zd9Vt8PBdRhkf8nUoAiKmJMcTlgJMPaqTNkzaIXjUho3korA92Dz
         lGyI0g3bfeWd+mVDBv775t2L/I7Ej/1qFy0QF+yc8E8aj1KVnqmCbVybYx8b7mJzsT+X
         80hlJB2OB0b65WUS7UL8bOCmYTy20SAG+HXANQzmhmebANjxYxfAO/vBniGptTBct/4s
         51yYDNeo3kbJ/lhslQOZUsTjV1vEETABFTqigI9LnWDurKXbNbiDr3J9Wxv0gFAsy2iH
         QAlcr4tuePqwQWGt4wLpA2Yt4AL3/FZfUvOihsuYriN1G/vm7nrX+51C1q5c4wUN4W3G
         eLDg==
X-Forwarded-Encrypted: i=1; AJvYcCV5dFuLmrZPat+kIvvPUbFsh1ctIhBPpvxcGCgDJhAqOBQtHvstcjrZqyiF7k94A9RZ4KrPTVPTZ95lhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9dUdKXXpTSZ/CM7R+pSxixWLuJRlR45FVt2wGeORAA+l4M/v
	+WR6f3k9A+/o7sRo8hy7SfJtRJnsuN3FIadCkk4dWB68DyCU8FlpQcXGDnVtfU5+Xhjjz/3H6WB
	LjOxFl070h5bsqGfxRIB+fUxqm5DCpCc=
X-Gm-Gg: AZuq6aK50zueoUvrb8rScS0EiBB4QYYybw9g6xu6WNkL7yS4RNSbYQOQ29pRnplaJG2
	G6ynLnE9bD2c7jtd9xJ4xFxvlp8uN2odthfJJeiAdF5AwWI/7xbDXX+o59KZzmG29rBH70V5p+3
	EzNhslbIhVqeETPMKo4pNPN1t8FMDqh8LXeKQa9P5100hec6nMqcj/HVml25oKwssKGCN7+ezs7
	Adj628qt9GSP81JwD9iCATVgV7PEVzCvRS/POp15FNidcbAAuZClBWED2cAkmS8gl2kSrw4kdjY
	v4pk5Xpg
X-Received: by 2002:a05:6000:186b:b0:437:895d:2026 with SMTP id
 ffacd0b85a97d-4379790e995mr28443792f8f.38.1771315381077; Tue, 17 Feb 2026
 00:03:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126190755.78475-1-clamor95@gmail.com> <20260126190755.78475-4-clamor95@gmail.com>
 <54043284-141e-421a-a54d-a018c884b324@kernel.org>
In-Reply-To: <54043284-141e-421a-a54d-a018c884b324@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 17 Feb 2026 10:02:49 +0200
X-Gm-Features: AaiRm53ZCyfWugOQKe4kY-vuDcONKKXG67PXhOfZLL9jhVLQi4IP8rUlD4WkPfg
Message-ID: <CAPVz0n3OEN2M=wj7cq_-qrYi5VkMUP4RcUB7=sQxnLaGGivKVQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: memory: Add Tegra114 memory client IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11977-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: A7C91149842
X-Rspamd-Action: no action

=D0=B2=D1=82, 17 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 09:22 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26/01/2026 20:07, Svyatoslav Ryhel wrote:
> > Each memory client has unique hardware ID, add these IDs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> >  include/dt-bindings/memory/tegra114-mc.h | 67 ++++++++++++++++++++++++
>
> This is never a separate commit. Squash with the binding.
>

Always was and now it suddenly is not? Maybe you should consider
fixing checkpatch since it complains that binding and header must be 2
separate commits.

> Best regards,
> Krzysztof

