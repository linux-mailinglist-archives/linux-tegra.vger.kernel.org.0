Return-Path: <linux-tegra+bounces-13382-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCofFdAhx2m5TQUAu9opvQ
	(envelope-from <linux-tegra+bounces-13382-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Mar 2026 01:33:20 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F265E34CB77
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Mar 2026 01:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BD423031CCE
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Mar 2026 00:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3C11D9A5F;
	Sat, 28 Mar 2026 00:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gM7prA5X"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339B27472;
	Sat, 28 Mar 2026 00:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774657996; cv=none; b=pjgUHWrCkVtSZq8mI6z+W0mgLuh3SeLAZEi8vEqnKAVJxxUnnCqdb1I0AAFD7Ilb4q/D2oo2UFdaXMbg+DsTWyRPtRGnewOItfM6u2uLt/8X2pKyOp+r17rrEkmRSRXNACLhaDMDdriSbArJ9T+4T16CRXuv1JcJ+G8yewE/4KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774657996; c=relaxed/simple;
	bh=FHeI1U9zHljUfkTrcBPVT4RBkEQ0KmgHmn4tWtjNYI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQoRLjTjRDO68cCUEVYPRy5ea62txc+SrKT/rVDjai7Ilt+x/QSdyWntbDjYs08FI8NU0W9Ljd9nvsBN4ufECrhfQEM7QlboRZoeWo2ultaqCKgCJ1beFnKOhTT8iUoRQdclFI8mulVqEiLEdS9vs13xVCYEqw9ClX7pP7VBaII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gM7prA5X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6EFC19423;
	Sat, 28 Mar 2026 00:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774657995;
	bh=FHeI1U9zHljUfkTrcBPVT4RBkEQ0KmgHmn4tWtjNYI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gM7prA5Xzq2hAE61BmrHOAtNaAZlmGQzeco1BrW0lOPBZEEWhyefaRwU71RREjych
	 bP6jzTdHxm3tzNj7jysH5mMpCTbf6osLqJvxpKchFHRHznOnDsqA25mGFAOGG3vxWg
	 i5B047/8d4R/J0GUsRy2we9uCo4NfSOEx6Gg5VVrd3LvqrefULSk6WHpJ+0mfIW4MI
	 f3yRfR4dgU6PtUM5Lz2EJwE9GBx6bQvZwugRP2HExfZb30SgTOH2rnw3SIqTPue8yA
	 7+sI5b4djppbDTYuVMZzOrPw8WLt1A36ioVwxO4v8YDR5zNSudQJ6QYar5eNoA4Lpk
	 i9n774Ihk5mGw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: smaug: Enable SPI-NOR flash
Date: Sat, 28 Mar 2026 01:33:08 +0100
Message-ID: <177465797840.888940.3081008578776144909.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203-smaug-spi_flash-v1-1-a6d477ac7055@tecnico.ulisboa.pt>
References: <20260203-smaug-spi_flash-v1-1-a6d477ac7055@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13382-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,tecnico.ulisboa.pt];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: F265E34CB77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>


On Tue, 03 Feb 2026 17:01:17 +0000, Diogo Ivo wrote:
> Add support for the SPI-NOR flash found in Pixel C devices.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: smaug: Enable SPI-NOR flash
      commit: e4722f5510930df0ae2467132f558b90fdc81ee0

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

