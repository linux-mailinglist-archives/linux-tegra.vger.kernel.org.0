Return-Path: <linux-tegra+bounces-14677-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIwrICDYFWpYdAcAu9opvQ
	(envelope-from <linux-tegra+bounces-14677-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 19:28:00 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6505DAA9C
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 19:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4BB8300BC4B
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 17:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89180407593;
	Tue, 26 May 2026 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dit+hUnw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mCG827GA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341FE3FADF8
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816423; cv=none; b=dy0Gudc48iDIT2wcEm3d+SBepqfasLsUULAhJ05a38WK+O9t7QaYzhjtRllbxIPNmriQtkRT+lkiLnLiuEEoZlX0kYeTZ7CckRbwTTeaXA2W6Y952h19OFeW0Vj7dYCaNVPOOVabQkf+rWcn7jEGLYaNudEIs1jzQAw0SQGx1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816423; c=relaxed/simple;
	bh=YRYeKiGIeRUVEcqtQ37wY7Dmw90+OgfZ3uew7J4z2jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBpk6pfMd+sJppr+GtGQyBL/4i7FIJ0TUYiJPBNqhe9GENEK0tna5nClu0IvOFXteK9Cqj7+jOy6x8DkAypcyEULcXu6TDM86hRSf+QNycDNqkXJ7MQ2RWCS6rhdeNfIrXis31jaXRms9I6gsP3pJ1rqpsqKJn7CFaVd+O7JPUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dit+hUnw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mCG827GA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779816421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IOPEqVDY+5err0E81AfsN3PV78PIz3lBGWYzfFDdrGg=;
	b=Dit+hUnwqFE28fX7r2QlUZ1xcaoSiLeYW1ZH0lgv5k6lUFFQT9bBkzMUlkZQrPv1Wab5Ls
	KMYqZd/AN9Cd3QwQAgSeO8Tj2btGf7qH03M1pYE9pg0SedOe5piVELlq/NfCMfJebejAiJ
	tcCsHJupSnpFB9j6isBXXUye3XT/An4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-L_xrHytzP5S_6ElIRJQnSQ-1; Tue, 26 May 2026 13:26:56 -0400
X-MC-Unique: L_xrHytzP5S_6ElIRJQnSQ-1
X-Mimecast-MFC-AGG-ID: L_xrHytzP5S_6ElIRJQnSQ_1779816416
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6326fc1256aso16759435137.1
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 10:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779816416; x=1780421216; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOPEqVDY+5err0E81AfsN3PV78PIz3lBGWYzfFDdrGg=;
        b=mCG827GABq4znyGKlLmkZzZkDmXnX6CkmkE9wcAgVVhIFNodq78d2wIDeHsMjjN955
         c9w6/Nz/fKMcihIoRq4q0ZI3NiHCNhfMnB9Lu2P/Gx5+pyml6iqhDYgP15QSBbjSziYc
         dv4b57DNh13yb2412aL7nY4pUZF8da2l+sHi76rzFtGoCrbv3byx+rkRfQpY1dZJ4QwZ
         xLzEqu8YnTVdamZiLEaX+7EkllBI7N7GFr3K+64F4F+HCykY4rLoDxCfcTiO4CHoCHFa
         UkSHI8JS2xBX9DaJyer9M0fjpvzqSLqtWoKxwgf+RWto8UgwP5U5frMSkeuaiIpFiB1+
         VsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816416; x=1780421216;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOPEqVDY+5err0E81AfsN3PV78PIz3lBGWYzfFDdrGg=;
        b=Xnlyl6cMrSf/VdY3RxuN564HYzjNpORa/rD53xzhnRKJH0wbd+pVenxAVUs2F36UKO
         +syTWoCiYG8QDwiMOfsaqOv20am2wjwWJ/cxGmsQatBA9VM2SFeZusS9v9YVINArWe3/
         xW50vX5FQujklFgSd6GiUMQHWNwjaMWct0WhKhnmTYnyXllsp5XAWFk8RZnYw/TWQWiN
         ct/RyCjfKoHRop5e95loJTiFZsakbqeFfj4eZhyEygUk0YUK98T1sCmcfTBJ+YBIWdjJ
         WdaxsoOKifE7C/PHy059P+oeH5Hh5Mf+wsXG014MYrUucmvEQcxhFjGC+MkOHg1XeH9V
         rLaw==
X-Forwarded-Encrypted: i=1; AFNElJ9E/G12Yl6w5eRdomAvTsUB3cnQCjiL0U3VRHq4pZsZebdLePJbWhihrHBF/Kjq32g9N6pmTH+LrFWYaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzho7AJzFBEuMdnef4bXV9mgC/rDy/WCcZh91b8N7qEX9Kz/AYa
	06kWtWtTJq8MXcn3wqbSdJrXcL3KD3iEaVd8L3K0sj72jqG6TJFtV35uUUAk89h7Ib9YP3HRVYb
	EPkP6q9GjMrWzWML1EeVLih+c6t4R3PRvacPASwQYZnvxje44pCzzggzUGgBHK54h
X-Gm-Gg: Acq92OFce04jU09RxbjGDfI47JvDq5XhJz+k8dqmZQgsMZ5Ie3xkcCdhtg+5qWLXNhC
	IKG85uKW1mOPNleHX0AF23AUyhJXjLAvzgajHPOMw+inR1f3RNOgJeUP+ubnHGiczx8R7q2gxW7
	+hSOLnWLvlmKaGMLQxdPZpFkjYZJeoPMMf6lN8gCNmcIDwItdCTDIMqmUPBkBwy5Ry0Kav6FWNj
	xt/ooVyaIGWw4yGj2TCbhFKwcF6+PFBtWkbV4bOEh+u6a8jP5sCBMZXkpZoxrZUaJ8lroF7XjJg
	xk+26d5rhnu6XD6d37qiDppl9rjlxtLF43n7GwFS8q1YAMEqX88XPzO5dvMtrulinvEzFcW3IK2
	oKFiB0xu/MgZPSiBk7gp9V1iWbazvsmgkV0SrP+eRHEEwCa15KJZ4c+0K
X-Received: by 2002:a05:6102:3f0f:b0:62f:5908:648a with SMTP id ada2fe7eead31-67c818f134emr11183114137.28.1779816415829;
        Tue, 26 May 2026 10:26:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0f:b0:62f:5908:648a with SMTP id ada2fe7eead31-67c818f134emr11183038137.28.1779816415083;
        Tue, 26 May 2026 10:26:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc8131524esm145812196d6.40.2026.05.26.10.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:26:54 -0700 (PDT)
Date: Tue, 26 May 2026 13:26:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Support unique names for multi-socket
 platforms
Message-ID: <ahXX3OjBsCTxaM_h@redhat.com>
References: <20260522163034.80330-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522163034.80330-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14677-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-tegra@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 8C6505DAA9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 05:30:33PM +0100, Jon Hunter wrote:
> On multi-socket platforms each socket has its own BPMP which exposes the
> same clock names. Fix this by appending the NUMA ID as suffix to the
> clock names for multi-socket platforms.
> 
> Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
> future proof against anyone changing the size of the 'name' array.
> 
> Co-developed-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


