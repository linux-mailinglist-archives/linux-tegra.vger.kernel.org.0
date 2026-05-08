Return-Path: <linux-tegra+bounces-14334-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBVdGj18/mlurgAAu9opvQ
	(envelope-from <linux-tegra+bounces-14334-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 09 May 2026 02:13:49 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5904FCFAC
	for <lists+linux-tegra@lfdr.de>; Sat, 09 May 2026 02:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 621913017F8B
	for <lists+linux-tegra@lfdr.de>; Sat,  9 May 2026 00:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022AC1C695;
	Sat,  9 May 2026 00:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSFeZg5B"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A83BB48;
	Sat,  9 May 2026 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285624; cv=none; b=uoSjIGvet38wGLR6NefYHdhK+3/AugiuA8KynhU1efar9pLwYNAU/NC/DYxpSVGqWgy+t6+gPCEwH6R8rNHfkChVSpsEeI4iAfmfGPKwE8QH/ufwvHgZq67Y0AgHwWxANWEen/+9t61dzEzh29kUfd/eBCD8JHrUZ3l29lEYP8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285624; c=relaxed/simple;
	bh=/ecytL0oAx5Ld6PTkFmYbXYxh2xyc5JcmTqjqxsjMik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hmu17YfhvHSQbhfMOJGzv/2LvamAThgl8nlvcLOIGGaBCRHRY0+JuOu7TofTKe9s6OrP+hFtAMDqJz2fz278jS9r5opFf7bzXOpXAEYeAIZMCpVQw+qXvcpG3rptWNdCUwp9YoFt79PvrXXb4TgIcihXWBa5qLVMylX/ynstrfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSFeZg5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C09C2BCB0;
	Sat,  9 May 2026 00:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778285624;
	bh=/ecytL0oAx5Ld6PTkFmYbXYxh2xyc5JcmTqjqxsjMik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TSFeZg5BvwFcbzHvLdipCuAa8qoC5gj0XT2Mdz9hxcS0t1ljMUxTHYkpA7j+CL6oE
	 q79nxhzYdQatXOlp3fgd2mtRGCfiJEL9G2kpGJwx5IuBA5hwE8SF0vvYvYsLhZPV/n
	 Q0ccVBP+gRPYT2HHJviOtIoRjsxPCItqNV5QLA20X8EhRC0mbllvGhfk5QDOKC7KEW
	 Y872LI9y3sbdiIep0CI+g++L0qAv/DR1cGgHRrU+GVubxVYTm0QaduMnsrc2oDmJQ8
	 0p28xf60d6VYB3CyyTBjq2ube7S5vz5VbzsAlA4s9ch5/KIbNPx10PoiGRxxAnzZzK
	 mh/pVbjQsFoSA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260507232131.438589-1-rosenp@gmail.com>
References: <20260507232131.438589-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit
 division
Message-Id: <177820154024.916152.3561938548534364041.b4-ty@b4>
Date: Fri, 08 May 2026 09:52:20 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/ecytL0oAx5Ld6PTkFmYbXYxh2xyc5JcmTqjqxsjMik=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp/nwvSLAZh/1jMiuKH1AOYXdSE8Wb+OoBCdOYQ
 LE3nQlXPByJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaf58LwAKCRAk1otyXVSH
 0JjbB/9lmEoXmnJS2o2tSyfaNxH+R7UCa1oCU5UaOKAVdoqYQsOPQTSuMOUmc5ilqPsXF7T/cx3
 +C/EDwU1c6DE25HmZoJPXel61wUh/G9lGCYoJ8LNur+90w+6rsUyOwH1lRk5pls9nxYyV31TkF+
 s0WCkQh6rM1kxXlPf+jyvQ81XfzNA0wCqsJb/hPqjidYiDo2K0bxfb5tKWyFBkU+LD3aldcvk7Z
 PuqNrFyPZgIjEI1limpojzvrdqWBUaGOmaNn4MVsYxw8gg2DsvRbrwUkppvwfM2pn/7NNDx4HsQ
 levtHctid7d8n62VjOFe/QtgIuK0fmFhTAeSiwUHphk9Q2p1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: DF5904FCFAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14334-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,nvidia.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-tegra,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, 07 May 2026 16:21:31 -0700, Rosen Penev wrote:
> ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit division

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit division
      https://git.kernel.org/broonie/sound/c/04b8f96b1088

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


