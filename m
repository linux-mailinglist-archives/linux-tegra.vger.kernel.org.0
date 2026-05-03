Return-Path: <linux-tegra+bounces-14148-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PnDOrZ692kBiQIAu9opvQ
	(envelope-from <linux-tegra+bounces-14148-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 03 May 2026 18:41:26 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D84B6869
	for <lists+linux-tegra@lfdr.de>; Sun, 03 May 2026 18:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90E963005162
	for <lists+linux-tegra@lfdr.de>; Sun,  3 May 2026 16:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B5C37646B;
	Sun,  3 May 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvJ34aRw"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3623CE490;
	Sun,  3 May 2026 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826462; cv=none; b=dCPnwXnijKG83gHtpesfTcuEnLhVpQqJR3yYiHMDQxENaLGyZq7h5lv5ZfwrvatPCfwMyqTNHGIlmn6k7liz4Qs/JXt+PMAlFdjxibaXX8/LAdFzMf46Dqt6QW6RcUgbhfrGOJ1CjMcdPy/x2f+K9ApERsfCK2x8s79Mqj4CX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826462; c=relaxed/simple;
	bh=on/dqkrXphunAC9HRLbMdST/NNHkqSYFCpshrtAM3i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MITFhpKwE8seg1YxR7VdQMYAeEKALKR1ENVvnjYEfZZbrYXftc9XdGJtUOs+8UkCRyVAv6qwXXNSOD3LKoIjoyFoDCip6m9w3RcUzf6aD2Pm9D28Qx1lG4qWw1z6jbpcDLjxF8DDelwvp0K0puj20wYTrA7agZUwHDKzLsoXWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvJ34aRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F29C2BCB4;
	Sun,  3 May 2026 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777826461;
	bh=on/dqkrXphunAC9HRLbMdST/NNHkqSYFCpshrtAM3i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvJ34aRwtkDhmd0YTNedezO9BrBfDRTsxjAJref8m/dTwWQzZyCvoa2qm4+6jcOQi
	 OsM9bnWUf1cil9A5GqI/8NPrHCcXrq0NSTOcqPSer/6tl3bilwksf/EOBzq9GChy7e
	 UMR7I4CSV3xANoVc8T154anBTOhQCZVpXrp58bGJw3sPpEq5lCjD3c/xpWq6mDmhV+
	 emNy7w8FlGw4+Yjpc4tpbTObFqxwjSY7QJNeSKe/LZX5Mo/6YD6Xz/Vbp3Lon6AF+2
	 L1/RADhBeXo4kPexOS2qAjqqye05wl7cBXdulwSHZO9C91ZmZgboioRd5jojGpYEdn
	 MUUkwdSn9Dpug==
Date: Sun, 3 May 2026 22:10:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Wei-Cheng Chen <weichengc@nvidia.com>, jckuo@nvidia.com,
	neil.armstrong@linaro.org, thierry.reding@gmail.com,
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, waynec@nvidia.com, wtsai@nvidia.com
Subject: Re: [PATCH] phy: tegra: xusb: Fix per-pad high-speed termination
 calibration
Message-ID: <afd6mX9MJ9Srl0Ie@vaman>
References: <20260304102649.3670783-1-weichengc@nvidia.com>
 <82f3ca77-7b8f-41b8-85fb-c502bc343778@nvidia.com>
 <fde997f6-c0a8-430b-8e45-38a490e683ad@nvidia.com>
 <77285dd6-e240-4944-a034-a4bc3acf4052@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77285dd6-e240-4944-a034-a4bc3acf4052@nvidia.com>
X-Rspamd-Queue-Id: 1E4D84B6869
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14148-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linaro.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On 29-04-26, 10:10, Jon Hunter wrote:

> > > > diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> > > > index d2b5f956513..810b410672f 100644
> > > > --- a/drivers/phy/tegra/xusb.h
> > > > +++ b/drivers/phy/tegra/xusb.h
> > > > @@ -436,6 +436,7 @@ struct tegra_xusb_padctl_soc {
> > > >       bool trk_hw_mode;
> > > >       bool trk_update_on_idle;
> > > >       bool supports_lp_cfg_en;
> > > > +    bool has_per_pad_term;
> > > >   };
> > > >   struct tegra_xusb_padctl {
> > > 
> > > Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> > > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > 
> > I guess this was missed for Linux v7.1. If you don't have any concerns
> > can you pick this up for v7.2 once v7.1-rc1 is out?
> 
> OK to pick this up now? It would be great to get this into -next.

Sure I can do that, can Wei-Cheng please rebase this on rc1 and send

-- 
~Vinod

