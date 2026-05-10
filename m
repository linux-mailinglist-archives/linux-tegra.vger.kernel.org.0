Return-Path: <linux-tegra+bounces-14345-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEw+L/54AGpZJQEAu9opvQ
	(envelope-from <linux-tegra+bounces-14345-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 10 May 2026 14:24:30 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4E503DFB
	for <lists+linux-tegra@lfdr.de>; Sun, 10 May 2026 14:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B82FB3017265
	for <lists+linux-tegra@lfdr.de>; Sun, 10 May 2026 12:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7515F37E2EF;
	Sun, 10 May 2026 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgCk0u3s"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18236657B;
	Sun, 10 May 2026 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778415829; cv=none; b=a0fM+4BsTWtVBNQ8GBxbP1ZPr1Xea83akOhr2rxY8rpMBIG9Io21icRetD8ugTNqnf18bfWkP1QmOmjOOX01dOfqFCaPXvPYCXpSxNjWBJAzQVH4vRmfjzgpMf6AEa7INXoC7CL6xSVESh4JGFwibORB3OFxY5SPhBJ6YLex+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778415829; c=relaxed/simple;
	bh=x1WogqHFVAt69woD/1Gf7Lf61vggakdMrNHQ3WQm5Yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iNVYE4mqee6C48tiLc0UwgVUnIej+WlqJlYgebgD9dfp2xyGZRcf+hw9Nek558LyEByZPCKQ7gJuO97GuT00v4qqsHpHcNA1az3R+S1xGedpcEB3JCOLlCTmt8snlp5f5qdkYrhghn+W248xcsIfEB6StTCQTVV5dvSIRb7pZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgCk0u3s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96487C2BCB8;
	Sun, 10 May 2026 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778415828;
	bh=x1WogqHFVAt69woD/1Gf7Lf61vggakdMrNHQ3WQm5Yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JgCk0u3sKA1e8f+nIhQbrj8DuqU8X0ml4I4RpPPTnqlAThnQE/HCnec8Ian6oZExP
	 YP6lJaQFa1Cu2JZeG9pF8m2Dp5dyPPHUBwqh0T5KlUyeeGBaLQMnVNZYyZMsLlmuNW
	 219aeKJMZbk2zOcXMGHF6cWM4VGncHUc6+OWqv80CErr0gSFgPVedZ+q8k0LRXAfvh
	 ViqAXYCYya0TDeWkUW3HpXIJj4b3gpFetVDXdu4y5W+SOJVv00gLEIEILhjZvqE6Qb
	 WrfvmRyL9GLyoQvPrqbi9zdTQXlpR03htjep8HTaxpXcOk+DB2ZEnxXWrM2XbZZl+S
	 aG9mhG/1CXSog==
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Wei-Cheng Chen <weichengc@nvidia.com>
Cc: Wayne Chang <waynec@nvidia.com>, WK Tsai <wtsai@nvidia.com>, 
 linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504033305.2283145-1-weichengc@nvidia.com>
References: <20260504033305.2283145-1-weichengc@nvidia.com>
Subject: Re: [PATCH v2] phy: tegra: xusb: Fix per-pad high-speed
 termination calibration
Message-Id: <177841582520.420676.17804594742388538049.b4-ty@kernel.org>
Date: Sun, 10 May 2026 17:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 67E4E503DFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14345-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 04 May 2026 11:33:05 +0800, Wei-Cheng Chen wrote:
> The existing code reads a single hs_term_range_adj value from bit field
> [10:7] of FUSE_SKU_CALIB_0 and applies it to all USB2 pads uniformly.
> However, on SoCs that support per-pad termination, each pad has its own
> hs_term_range_adj field: pad 0 in FUSE_SKU_CALIB_0[10:7], and pads 1-3
> in FUSE_USB_CALIB_EXT_0 at bit offsets [8:5], [12:9], and [16:13]
> respectively.
> 
> [...]

Applied, thanks!

[1/1] phy: tegra: xusb: Fix per-pad high-speed termination calibration
      commit: da110228b54f2e2143d97ea7151e0dc22e539d67

Best regards,
-- 
~Vinod



