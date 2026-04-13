Return-Path: <linux-tegra+bounces-13730-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC96HoWZ3GkxUAkAu9opvQ
	(envelope-from <linux-tegra+bounces-13730-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Apr 2026 09:21:41 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB913E828D
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Apr 2026 09:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3E143004438
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Apr 2026 07:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD23B39150F;
	Mon, 13 Apr 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1jEkIGW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8B3612E2
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064895; cv=none; b=I7yYdI2yZUavXFZKeVOFFTbBHmik6gtV3PdClzkYEYjEDVKSLqJax5n0eBywTVgfo4UkoG3XCUt7TwR2zkrtto5FS9A+IK/pgsNgJKrbptmEnRd4+PNNsCl+6uMH/2AUJpdaZV1s5hnFFMnFrKj1CPTSzxmYgnI47tETteaYYno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064895; c=relaxed/simple;
	bh=dPLuupoDLLr+Wx19Z3u7DYxO18a6a48VRDBlxNU+JIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkAsvWWcXu9I/RvYVJ4brDoO12JCDEO+uOYXIV3f60qdoTYwfATmk2XRvsIAk5745LI18QHSlSeOPG52Gypj8ysnNbZkyzUbbaEyKjhFRRlkTiDejcmt1Uo26ePKY/xKxEhkrcLugzBP9BS7s/pxZn/Hfy7W8jeivzHUK1fa+0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1jEkIGW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7605ec91so734157f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776064893; x=1776669693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iw4ljpgUqAKzzrRRr5hlS15ea4IPkp99uerSPaTGYwg=;
        b=V1jEkIGWqG/8/6P6LxcgA4AGNYqZ+EbUWeu/rDfz2cAaywc7oCBZ0bLzhP7OkWPeOv
         AHr6P1KOBXsl/x1Hi3A6FFTUcYmVL/lpdXUJUFsgDMhCWLF+7qwmumf71NEPz7L9mq3i
         aVJE7mAc31AOHz8L6cyGoCRSBIv9ofBta42XMCqkwodI/X/jJ6u+Y/8qF+LNYb0DTAhI
         sQt9P+Sr5FvRdBrNtNVEfVbQg+3yARWn5j4k2hoDGdhUEBOmdKfbHXSWkbnwDqAXi16m
         leUiAtPRFKR++co+h9FArK+FMkrpI9wZU8HeJECK3GBfjZJVJUSGbHMDEFpO1V1lp7Ip
         vP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064893; x=1776669693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iw4ljpgUqAKzzrRRr5hlS15ea4IPkp99uerSPaTGYwg=;
        b=NRGmCLuqLODT63pJLcJlw/Xd8JFyW6g15FnZfYTHZ4bTyyLuaMUmwoPDNuqevMzhsd
         wvuFcKJNxHZvmXDaqks24yTK0S65TuhN1LBowz9dz885t1lHZjG+rCWBqMYffF5MHlsy
         f0TEctI0hfsClhsM2MRl3W2qvFeCXTATA2dU/ukkDHYXRT35dXZwZbffQVApFwHUvRNP
         vubB+PKgjy7UKRW3zCoEWBWROdQZlRCvwFrKdCKmqWVqT0u3f3dZNGofjjypsWhWM3KP
         Qfd1N3xeHdjcgmiHrUOJ7fz/bE3pqaAuUpiWC9Vty+rduyAv1l2UFlsWtnzYvtQ6/yNw
         QmCw==
X-Forwarded-Encrypted: i=1; AFNElJ/TjLVx2kgF9I+Wv8ZFn6TtjMm6rvebpzDzBRAbcE5wY/dPoS8Qjke3lzHrF6YuEc1QrFyUF3ZU23xsDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3EsCNoQkpApmcNg6jNvno+OqPoDoXb/hyrA4PDfhLHx8jCeic
	ZG+D9p1Ox1me3t8sF+afIzB4KVYBvhO9BNWvHJktFth2t9Rd0sH/7bIt
X-Gm-Gg: AeBDietuGUUIgrrlfU2VrKWnEHPiInSnQQ5p0f0hkBOiCh5JiVnXe0CwLuemLnCSfyU
	+XYMbnS2Gb9GUpiGHFuclKWmwoZQFhNaMCRX7ythCDUpOdjaujPpDkj7m/qwVhgp/SNNVmaxVW9
	ghFWBsLdA16ieighAlU5c1NA0OagE/n983vw7mJWDyAamBO2eSynjUT/Gl9oaC8MQTRrpHsQu06
	UbH36QXVCQH0YIvU1g0t7t1LCo4N5I9BqsWrG4kcphSohvbQ5QZ7Ne1UXODrhLZb+RI7lDwbOtG
	33AI8I4kp2c7y8HPIgDrLOPZo0FZxdjBqNpMCUHD6Z9Ut9fy2Eh70jbxgdC/Nxub6As1xvvDUNZ
	5R4mYuYO9L2sJDYQFNvzZUq5yVslDM+Tmqqa/YibPgCyemQQ+5Jyn0nO6STbloqxzxUjJgX8XzT
	M+NWSTPmBYfWj1Pzkq13cEoBmbKv5iYQ==
X-Received: by 2002:a5d:4b05:0:b0:43d:7508:c9c6 with SMTP id ffacd0b85a97d-43d7508ccafmr4141774f8f.28.1776064892744;
        Mon, 13 Apr 2026 00:21:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7c135fd6sm3713097f8f.28.2026.04.13.00.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:21:31 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:21:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: tegra-video: add missing error
 checks in vi_tpg_fmts_bitmap_init()
Message-ID: <adyZeOe1aL-0cSB4@stanley.mountain>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
 <20260411211006.150782-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411211006.150782-2-hossu.alexandru@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13730-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 7DB913E828D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 11:10:05PM +0200, Alexandru Hossu wrote:
> tegra_get_format_idx_by_code() returns -1 when the requested format is
> not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
> check this return value before passing it to bitmap_set(). A negative
> index converted to unsigned would result in an out-of-bounds memory
> access, corrupting adjacent kernel memory.
> 
> Add WARN_ON() guards so that any future SoC addition or Kconfig change
> that exposes this path fails loudly rather than silently corrupting memory.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index afc7327ef318..e6416ea8503e 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1025,11 +1025,15 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
>  
>  	index = tegra_get_format_idx_by_code(chan->vi,
>  					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);

This will only fail if we can't find MEDIA_BUS_FMT_SRGGB10_1X10 in
the tegra210_video_formats array.  The commit message makes it sound
like this fixes a memory corruption bug, but it can only happen if
the memory is already corrupted beyond hope.

Please write the commit message to be more clear that this is not
a real issue in existing kernels.

regards,
dan carpenter


