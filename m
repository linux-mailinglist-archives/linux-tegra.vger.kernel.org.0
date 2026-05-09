Return-Path: <linux-tegra+bounces-14335-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMbXDjCX/ml5tAAAu9opvQ
	(envelope-from <linux-tegra+bounces-14335-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 09 May 2026 04:08:48 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E64FD8AD
	for <lists+linux-tegra@lfdr.de>; Sat, 09 May 2026 04:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71A13300B599
	for <lists+linux-tegra@lfdr.de>; Sat,  9 May 2026 02:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED792BE65F;
	Sat,  9 May 2026 02:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOrmW/Cn"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04B2BDC0F;
	Sat,  9 May 2026 02:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292525; cv=none; b=gIU6oYXipZhZRd50tfdlcyxwmHNPYV0a4v3FVdLNTIdKJNn5BGmTgMOOxypxYuzukUFtB01z8YFHm+/b48l/RzXMUMYEfv15U3DjOk1r1B2yNORcPzRucvxuwAZcWRCKkirD8v2eSCjJdZ/utxmRQTzMgUJC8eYIkOgKbm4l6qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292525; c=relaxed/simple;
	bh=KgkbFJ3/6OaGWC01MXEGMQogKNXOnRDZa18BoowgJfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USvc6tRWMIVU7M7L7MWQ8mcYNB/LMAy4O8XIEvPsN6zSBlCpy8FM2f2huLJNjVdyhV9LGYnfTJ8Y6FVUIBSclV7OKGAhZH2fkfGg7SJ40Jiy+44wLwOToHAxnYw6EXOuXeFslNQmIxy6aF1fHoKvNNvCq6fpj6XNcWNRxdXgrdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOrmW/Cn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6216BC2BCB4;
	Sat,  9 May 2026 02:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778292525;
	bh=KgkbFJ3/6OaGWC01MXEGMQogKNXOnRDZa18BoowgJfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOrmW/CnyYudLMeJxjLw8okgsYiKYNsdyHkdQBj4QCET1pO/I1qhWQGCw3rKWqAQk
	 tLhkYIgSOwOob1ClimwucoeDt6Le40foH/7EFZHzrSvhaWSa4OaU0VXeSMA6gqlW1E
	 yjay8R1UO9wF6AUt/x9ZGGLI9piJQ4yd3evc7/odsufg9FppMOKHR+IkqNVxyMN64N
	 NLydQmWXB3e6dSgn8hpupTPkRDaovflIUTekSqobYkMZS9N13Q3ykL4L1k6mgx6CwN
	 wm/ugeEDA4PFohqqLlUrr3SO9C2eIWV9FAQooiVheyDE5VFGwIfGdq/HkmULdV7z4h
	 y+0sQhOuwS9lw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jassisinghbrar@gmail.com
Cc: Sasha Levin <sashal@kernel.org>,
	sudeep.holla@arm.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	joonwonkang@google.com,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6.18.y] mailbox: Fix NULL message support in mbox_send_message()
Date: Fri,  8 May 2026 22:08:38 -0400
Message-ID: <20260509015927.agent5-0002@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507062107.2927600-1-joonwonkang@google.com>
References: <20260507062107.2927600-1-joonwonkang@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1B0E64FD8AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,nvidia.com,vger.kernel.org,google.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14335-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 06:21:07AM +0000, Joonwon Kang wrote:
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index ff292b9e0be9..7a2baeca2ba4 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -361,7 +361,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	if (pchan->chan.rx_alloc)
>  		handle = write_response(pchan);
>
> -	if (chan->active_req) {
> +	if (chan->active_req != MBOX_NO_MSG) {
>  		pcc_header = chan->active_req;
>  		if (pcc_header->flags & PCC_CMD_COMPLETION_NOTIFY)
>  			mbox_chan_txdone(chan, 0);

This pcc.c hunk does not apply on 6.18.y: commit 5378bdf6a611 ("mailbox/pcc:
support mailbox management of the shared buffer") was reverted upstream by
f82c3e62b6b8, and that revert is already queued in 6.18 as 2cafad617431.
write_response() and the active_req-driven txdone path no longer exist in
pcc_mbox_irq() on 6.18, so this hunk is both syntactically inapplicable and
semantically unnecessary.

Could you send a v2 omitting the pcc.c hunk? The other three hunks
(mailbox.c, tegra-hsp.c, mailbox_controller.h) apply cleanly and I'm
happy to queue those for 6.18.y.

--
Thanks,
Sasha

