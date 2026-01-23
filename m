Return-Path: <linux-tegra+bounces-11517-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OU7Fcl2c2kEwAAAu9opvQ
	(envelope-from <linux-tegra+bounces-11517-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 14:25:29 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1917636A
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 14:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AFF93016D07
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 13:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A172E285C;
	Fri, 23 Jan 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5OSP2t8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XDNzuahY"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AFA23741
	for <linux-tegra@vger.kernel.org>; Fri, 23 Jan 2026 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174723; cv=none; b=ifRO3EO5JkyZ0FZrHkiZmf6AKs7eZumFoZ/U8t2fEniEVCSQjnPSVA45PcRjVAU3DZWF4/ik8/n8PHSUZ1wvbPDasuSSH+ka3xn2bUiw98A7ufvtDpSW3zsDw2OW5uirJIWCgRs6wbOOjwou+iedDeywSi17XQ2sQDYCSUIHPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174723; c=relaxed/simple;
	bh=dl7NlkiIvE4aCaKk0Pre5K+Ti7kNdoTw5jT1Cl5ZZAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+rNmt5GlhtSxsHrIvFeF1QWhbND0pajQx4fYiLt4EF2oxZd9f2lIS02ngy1swWs3TMiw8jhuEtLf1WaWjE8GsYhk7+M36oulZ01N5Th3z66xsZ6II4J2ZlQRT0bOAvB2XmB4zsJZJBpBkhZ7u9P9LwqjNROgdcE3C8v0GpQ4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5OSP2t8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XDNzuahY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769174721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dl7NlkiIvE4aCaKk0Pre5K+Ti7kNdoTw5jT1Cl5ZZAE=;
	b=B5OSP2t86RRnFNzdmsmEzd12Xkc0c9MiH0FxIAgf7bSwNYjpN4QcCfyeBTyikbW+xIeZy2
	E/Un8+EW8vmwzRiFolCskDKVJuhO0IBSIDn0eAJybfCAfl6pgtzx8PQgFZqJF9n7mLGXjp
	tRSy4vsjnWCApm+MjuPu0kwTEzjDBAA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-nMDM3OhPM2m78FgsiD0dsQ-1; Fri, 23 Jan 2026 08:25:19 -0500
X-MC-Unique: nMDM3OhPM2m78FgsiD0dsQ-1
X-Mimecast-MFC-AGG-ID: nMDM3OhPM2m78FgsiD0dsQ_1769174718
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47ee432070aso16621755e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 23 Jan 2026 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769174718; x=1769779518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dl7NlkiIvE4aCaKk0Pre5K+Ti7kNdoTw5jT1Cl5ZZAE=;
        b=XDNzuahYpZY1+ffEsI1oHQAuNWyG+fSG5E2eetzeTcFaM/ziV/h6mh+hO+4S4YCSg5
         v1xP8sZebdOa7ofQ0zKF1VPDK3RlQTItNlCDL+E5dzbcaingiGpUabwcEwb7I+sHP06O
         yShN7AfLlL+Sy6JJAHKZ4et71hOXtX7ot7Guee+9yCGztrLIoQsvTY9Fyiw47Dmv/IOX
         fxWrG+UHo+L2UALjv8ftNPVwYjsJEJ5TFK6ThbLtSiKtD2uYOP2WdP8KuUilue+PX+hu
         G9Lgd0rrUg1SUVBgeRHWrEa4YFsJJm1DJxRZVdjBqYoGdxkmU/AZyOfaEhO/rSMtkvMK
         gh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174718; x=1769779518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl7NlkiIvE4aCaKk0Pre5K+Ti7kNdoTw5jT1Cl5ZZAE=;
        b=NZ1pMU2eQPCfJb6Eb10j3C8ACAck7k6AO8pbiRj7KfX+a7qeZedWWX8WMbAT3aaxGD
         15iYwAasI+Fj5KU281H1UorxwbV+0EmU2ynM0M3LhF5CQ0ch/mLtiuJbn8Jmafx65FQ8
         kf7QsPjfUgNQUazT6WwpiTauioVY/UO5LdpvC0rqppz3ronVZaWvB8HhP35WxsFHITqL
         7a5TbgkUYYG5h0XnInxHbpHPjgZtRe9QKmhnloQhf6ZEdswFcrGhQ6aKkVvmHfYsGrkK
         yRiUebiXolE8qRF0sXrGKAUy/71NPmnDaT3zYny5aDzoFVbjgxlCbDvGU2iYzflDyB1e
         myiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbR+dAVpCRCJkpf3aw3ZT2cE9REZ07ude6MwWCAUGs6jbpGKdRJcpiLJ0rnS2SP1a9yPc/XhtiN5iN2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6zWjTLMjYnYg+CFE+/xG037rBhCdIr/znwPAwYfIjV9eLAtYz
	kc8KCxH5MDdcsMQhSWg9IeCC668UgkRiy24PErtR7AAn2iVevsYNqsxKF0o2jVtx+0avkawF1A3
	NctAFjWhEDGzpT61J6RMJ8HLj1l1PKE8MUPJis0JC0anwawvWqv4o1W9RI0xC+BL+
X-Gm-Gg: AZuq6aLTqif4krBwUbVMDj0PQ6k8O/Nysos4Vnp8OI8YX1r2a1PCP4HwQxhXraer7RV
	yfk7TAKgKyY+QL0dIdLK5kLDrweJXYuv4ZMd1uK1yfTkoErHo7kbxqKvzIeZWshCTrPYWPRTb5J
	dDI9Z6QnXa4Ayp196U7o8e+HNKM0NTFQzy21DLHkp3q2TiyPaxoyXHIQtQBN6/o+K/ifUB2JwwG
	Q15NorDeSdQg+2OoPz0D6/ktFhGRnthd6/PnJT3Ghnjhb78oP1q3dbaUp5bl1c5IL99QGc5BqLK
	6PiHmntKOUSTxR7jTgcd+q7OeRfO4t/VlwUUNJhBApRDICfsY3kxaskomP6llw==
X-Received: by 2002:a05:600c:c16b:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-4804c9b2113mr49821945e9.22.1769174718343;
        Fri, 23 Jan 2026 05:25:18 -0800 (PST)
X-Received: by 2002:a05:600c:c16b:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-4804c9b2113mr49821235e9.22.1769174717712;
        Fri, 23 Jan 2026 05:25:17 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbaad79sm21251445e9.9.2026.01.23.05.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:25:17 -0800 (PST)
Date: Fri, 23 Jan 2026 14:25:16 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <20260123-active-witty-rabbit-0fc5b9@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-5-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="equ2x5ui66msv4bz"
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-5-thierry.reding@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11517-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,collabora.com,arm.com,google.com,linux-foundation.org,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,kvack.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE1917636A
X-Rspamd-Action: no action


--equ2x5ui66msv4bz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 05:10:03PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> There is no technical reason why there should be a limited number of CMA
> regions, so extract some code into helpers and use them to create extra
> functions (cma_create() and cma_free()) that allow creating and freeing,
> respectively, CMA regions dynamically at runtime.
>=20
> The static array of CMA areas cannot be replaced by dynamically created
> areas because for many of them, allocation must not fail and some cases
> may need to initialize them before the slab allocator is even available.
> To account for this, keep these "early" areas in a separate list and
> track the dynamic areas in a separate list.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

AFAIU, this won't create a new cma heap when registering. This goes
against the recent work we did to create one for every cma region.

I guess, since you have a driver that would explicitly handle that
region, we should create some kind of opt-out mechanism, but by default,
we should still create such a heap.

That being said, it's not clear to me why the heap driver uses CMA in
the first place.

Maxime

--equ2x5ui66msv4bz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXN2tQAKCRAnX84Zoj2+
dtsNAYD+XKsLdRQjkWGztlo6ccvGIarpCsAjHJYFv0zPbdpfdWvfyLFS1lY/kTQQ
0g9g6Z8Bf0j4St2GiD6RINFxEH7YvowARYnLD4kKLHV0CjY6XFcfRV2lK+cZmof9
IIFG/01OiA==
=as/Q
-----END PGP SIGNATURE-----

--equ2x5ui66msv4bz--


