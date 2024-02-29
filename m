Return-Path: <linux-tegra+bounces-1103-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE086CF91
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Feb 2024 17:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D85B1F24701
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Feb 2024 16:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426162E3E1;
	Thu, 29 Feb 2024 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnaoeKKf"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66C4AEF0
	for <linux-tegra@vger.kernel.org>; Thu, 29 Feb 2024 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709225175; cv=none; b=KSjaeNkqdjtbwC1oX9EOKcdOQW5vzYUnRhRe7HIyybzO2C8EjB8HoKCzjFnT4O2yPBPPr+4mx8RqKshP3hHTb++xO4nFNU4k1ky99aPXDZRP1irrlt42YbYhea8HfML00ZhzVx2utKVmeH8Qdul6UYmxJzuQGitUiRMczXVCKHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709225175; c=relaxed/simple;
	bh=8RqIIXF34nZ8GXlY8oIvWGsjhyeVgFUKpX4/XuHmuEM=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=skrOSpSIJhO69n+H4hwE0yKiUeND/5IcZX9JKzW9Fgx++lIuBg8kEwQlSQLRBB/UYnjtneiEhLr9vNga6a2OnttMvFBP7bdZm2E+0VQxAmttBXATh0K3RXilsUf0E8Ni6astkwIkI5gMUCfqBk/qnLetdmWbYjq09/THmRwTpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnaoeKKf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d28468666so774942f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Feb 2024 08:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709225172; x=1709829972; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhbu3vuLuSjWsdzC0FVCBhGVPtGx1e4BdeAUYrGCjGY=;
        b=YnaoeKKf3vEcgwTBGmCWB3i9P/We+Nx9UGFyuvVsUQM8wx83cXcnM3+5fNt31ddhzp
         dHRuwuMTVzp9qQSljXOm9YthJjJVvgipyGxxV81svlenrdH/W779hFBQs//Dk8HaKACO
         7xGnK/b8QXfyLshW3UOA7b0l8wq3zROKqS363/UPD/lPx0Xtelu5XjbSodjC+3T25Ckp
         NHG6/kShPtgCXjj+cyf5VHyjdKis1alHemnmGjKbaHSDpDrk+Bmh5ZMl2RqFrpTX8l20
         WjaYQVRgzn/Z6bYIHKkhtWZUyjxUluKvzzzIxHhY0fzSieRn3lc1hYEzu7yUUbNK1mRs
         6SUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709225172; x=1709829972;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhbu3vuLuSjWsdzC0FVCBhGVPtGx1e4BdeAUYrGCjGY=;
        b=OIrME6gBHpSkzGB+MHy3esWxtEZa/CvL0KLidWytNyTGucXXZjKpkhKuJEy7HzHzWm
         x87g3hOIVHojQkwhAQYkVHhNeCA2EAdfAz8MLureKynfoo8uMSRhKvXm5J7wa6GgdOpi
         yCyAd7wNbf6wvnDH/OJxrtXhppkXySqJ3/AeCd8BfUb10SIvME7kCwZ8q0vBR42x6i5l
         DKNgGJ+GypaQo1GJgSVyjO6ABTes5vnsOSvR2kz1LaFU8WMgvz2SaaMPGJDqirJrKTKJ
         5hXMtFZj4w7zHpI5zyE89dsg1px4Zxye+9FSU17FBEWeKst9nFHzSiUiagJbP//W1u88
         sHJw==
X-Forwarded-Encrypted: i=1; AJvYcCXeV6Mu9C0K6t1Ktu+ykFBqK7kQc4cCMv9qhJOIlX99CgGyi74m5OXDxou351EDhd2IM8ekpdba8Hs+G4bJraPuqCfQTteaAP4A5KA=
X-Gm-Message-State: AOJu0YzqVPWQCWBa4en8n3itwyPBNC6nkjzHKDriGvDaXxqRyYG764V3
	jWGbp/deeIs+QzTBF7ZmLnSi1/88Fr7gI7zMCfM6h9gKVuZmQrTk
X-Google-Smtp-Source: AGHT+IEGglLrQpgc8Roh+yvWbM4T0Y02kCuG+aROzWTVgaMbxUg/3rk3hM/+2sHShiMAsrYZq/S0/A==
X-Received: by 2002:adf:b64e:0:b0:33d:3ee3:cc0a with SMTP id i14-20020adfb64e000000b0033d3ee3cc0amr2287039wre.0.1709225171428;
        Thu, 29 Feb 2024 08:46:11 -0800 (PST)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cc6-20020a5d5c06000000b0033dd4673a4asm2258126wrb.71.2024.02.29.08.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 08:46:11 -0800 (PST)
Content-Type: multipart/signed;
 boundary=aecc9b8c48571b79653ff9adff16128b76ab31233217e3a39eac093068b2;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 29 Feb 2024 17:46:10 +0100
Message-Id: <CZHPR7BLVDWK.3I71VAJO1OSNZ@gmail.com>
Subject: Re: [REGRESSION] Failed buffer allocation in Tegra fbdev
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Jon Hunter" <jonathanh@nvidia.com>, "Diogo Ivo"
 <diogo.ivo@tecnico.ulisboa.pt>, "Robin Murphy" <robin.murphy@arm.com>
Cc: "Jason Gunthorpe" <jgg@ziepe.ca>, <vdumpa@nvidia.com>,
 <joro@8bytes.org>, <will@kernel.org>, <baolu.lu@linux.intel.com>,
 <jsnitsel@redhat.com>, <jroedel@suse.de>, <linux-tegra@vger.kernel.org>,
 <iommu@lists.linux.dev>, <regressions@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh> <20240123151508.GR50608@ziepe.ca> <pgund4coabp5pdlmwze5o2d7ogrdncktqz267yzukjcvmikudc@7svrwdci7ujl> <55cab5e0-0abf-47d0-becc-05cdf1d22fac@arm.com> <r46zhd52g3w3kpu4jjca3vihmv5ahp3jcwge3rvg42dupxf2g4@p2u5mbdyypw3> <02a8d225-99cd-4dfe-bf49-b002aaa045d1@nvidia.com>
In-Reply-To: <02a8d225-99cd-4dfe-bf49-b002aaa045d1@nvidia.com>

--aecc9b8c48571b79653ff9adff16128b76ab31233217e3a39eac093068b2
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 29, 2024 at 3:50 PM CET, Jon Hunter wrote:
>
> On 24/01/2024 12:56, Diogo Ivo wrote:
>
> ...
>
> >>> I did the tracing and found that the ENOENT is coming from
> >>> sysfs_do_create_link_sd() in the following function call chain:
> >>>
> >>> of_iommu_configure() -> iommu_probe_device() -> __iommu_probe_device(=
) ->
> >>
> >> What's the call path leading up to that? If it's the one from
> >> host1x_device_add() then it's expected and benign - for fiddly reasons=
,
> >> iommu_probe_device() ends up being called too early, but will soon be =
run
> >> again in the correct circumstances once we proceed into
> >> host1x_subdev_register()->device_add(). That will have been happening =
for
> >> years, we just never reported errors in that spot before (and frankly =
I'm
> >> not convinced it's valuable to have added it now).
> >>
> >> Thanks,
> >> Robin.
> >=20
> > Yes, it is the one called from host1x_device_add(), so this
> > is solved and only the patch sent above needs to be merged.
>
>
> Sorry for the delay in getting back to this. I have been doing more
> testing and the backtrace I see from this warning is ...
>
> [    7.001380]  drm: iommu configuration for device failed with -ENOENT
> [    7.001550] CPU: 4 PID: 263 Comm: systemd-udevd Not tainted 6.8.0-rc6-=
gbbe953beb8b9-dirty #2
> [    7.001559] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [    7.001564] Call trace:
> [    7.001568]  dump_backtrace.part.6+0x84/0xdc
> [    7.001583]  show_stack+0x14/0x1c
> [    7.001590]  dump_stack_lvl+0x48/0x5c
> [    7.001600]  dump_stack+0x14/0x1c
> [    7.001606]  of_dma_configure_id+0x218/0x400
> [    7.001636]  host1x_attach_driver+0x150/0x2d0 [host1x]
> [    7.001664]  host1x_driver_register_full+0x7c/0xdc [host1x]
> [    7.001711]  host1x_drm_init+0x3c/0x1000 [tegra_drm]
> [    7.001746]  do_one_initcall+0x58/0x1c0
> [    7.001752]  do_init_module+0x54/0x1d8
> [    7.001761]  load_module+0x18b8/0x18ec
> [    7.001770]  init_module_from_file+0x8c/0xc8
> [    7.001777]  __arm64_sys_finit_module+0x1c4/0x29c
> [    7.001784]  invoke_syscall+0x40/0xf4
> [    7.001792]  el0_svc_common.constprop.1+0xc4/0xec
> [    7.001814]  do_el0_svc+0x18/0x20
> [    7.001820]  el0_svc+0x28/0x90
> [    7.001826]  el0t_64_sync_handler+0x9c/0xc0
> [    7.001845]  el0t_64_sync+0x160/0x164
>
>
> I could have sworn that this was coming from
> host1x_memory_context_list_init() but that is not the case.
>
> Anyway, we have a test that checks for warnings/errors and this
> is causing that test to fail. Even if this particular instance
> of error is benign we would still like to trap any instances
> that are not. So is there something we can fix here to avoid
> this?

I was wondering why I wasn't seeing this and looking through some of the
code I noticed that I have commented out the of_dma_configure() call in
host1x_device_add() in my local development tree. I probably came across
this at some point while trying to fix something else with the intention
of getting back to it but then never did.

Anyway, let me try to refresh my memory and take a stab at fixing this.

Thierry

--aecc9b8c48571b79653ff9adff16128b76ab31233217e3a39eac093068b2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXgtNIACgkQ3SOs138+
s6GXwQ/8CyWN8BB/KTF1iGQFIOz0qskslmxmYkGGV8EfwnYfO/7ks38fpbHrr7eB
9QzidX0bEFQYH02YWA5ZiwYdcAbRHoiZWiSVN0bsL43oFeGZ3OmwJGvJ9I4mc9iT
R0DMBvTU8ujju92dt3oOsAGo9X1s+O3evR1R43Ijqc2yQKi9wJ3MVTZ3GzsXvWum
bTLf/XOswNiQ+rJfQtJXXxbjwnk+6Ymjn21EPWje6u8VhSyc6uGz3MUbSfFcxdu6
g8BF7Ags9+qQ7cIch0f9xBwRgBCoXtxGGn+1rce6gHs82vYEA43q5053tm1zWAlM
13bSIWGH/4qY9RQEeLEaqjzKnyjg0gJBDr1a1Y7OpT4pDoirUOT1xQtHU/jXzRkz
Gu5u/Qx7jNmU19A0GK5d/bcGHheWRQ/ETdrqxx8lQjZfhsbHcmfquYDxtcb6Hd3X
SqwPJ9cwW5jJAIodYfLOXk0/Sz+4NhmqdfbSQLEcYJMZ/zhZHZJ1mBPavbixl/oa
xQrx9ALHPLaNv5FFfSX9RGmPSELlqBUvFJVTxcsTl/Zz2Ijr4Bkh0C+6ctGut/QG
vNXNM2Ht3mpQ2XFMwZPPJZuCQiLb+YyJX3vQFial5qrG9WIBxNjGMIguyc20dTTe
KabASO6ZAtq1IBvK/gdnlTU7Vgmzjs2ttZjSSJ/DKs00LNhJ9z0=
=jm9P
-----END PGP SIGNATURE-----

--aecc9b8c48571b79653ff9adff16128b76ab31233217e3a39eac093068b2--

