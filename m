Return-Path: <linux-tegra+bounces-13295-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBt/G+MYxWnr6QQAu9opvQ
	(envelope-from <linux-tegra+bounces-13295-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 12:30:43 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1EB334874
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 12:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14AE0305B0E1
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 11:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB213CEB8B;
	Thu, 26 Mar 2026 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2pnleWt"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D683CAE85
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524519; cv=none; b=Be34LvPB/9KTW93V0ea3XO6XrTDSQPPSL9ji3QMHzMgiBMddNeE8UiiCgOe69z67IR0BykoMnNtHExGiIrHT+R0GiaNzuJmBoYVtE6NtjMCAkXBg9Ff5FBRE8pY67TNzPwSPjZfwL6zYpjWeHHO0xY4sUfWRzAXdeM2rPuu/uwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524519; c=relaxed/simple;
	bh=SuhWVLOpmME3KgNqo+uk5QsQtgbCDFvyt5EO1DDbThU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hX5qmX/HRgYq2a53C8ikiOXxnAFMJWCgwMxgk+Bl34pL6tyzlGVR6qQqmrWwrPTSwAjpQH2SjB8wilFFKV4el47jQFL5Rm6QzdFtdh6aeDJpoFuj/+o5U4ECOe6KZotK111nTnUtmiK5+25GUjBeUc5JRlzVBgM7k6pIf0IBBvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2pnleWt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1685FC116C6;
	Thu, 26 Mar 2026 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774524518;
	bh=SuhWVLOpmME3KgNqo+uk5QsQtgbCDFvyt5EO1DDbThU=;
	h=From:To:Cc:Subject:Date:From;
	b=q2pnleWt4pj8OpA4TImNSOokSKRZC4RJydJo9b3jUOLifA1YFa9cgWw19UPwoBY4P
	 upGta3/VMJDYuxak0dgSFWaGQQ2q2JvOp5E8/9GHEmQulkCL+a0uR/h9aL9uNm0cOU
	 0DKuU7+VfXjP2i01St+mAgyinGkB/HIh3grMN2+TKQPbodVg0DcJka2VIeaBARnOBj
	 0AiSQ60kXrQapgaXrbH/B40Ggf5/9uUfTIMYUN+K1KeZ0T73OZCEe3WnDAQLclTUim
	 BzQv4ay4tZC975JXYB1u+a3PLLhGBeP1EaEsF3Uh5I+gGlnsrjPhR44dlViahGxOXj
	 RgqQX/uS26y1w==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP
Date: Thu, 26 Mar 2026 12:28:31 +0100
Message-ID: <20260326112831.2783853-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13295-lists,linux-tegra=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: DB1EB334874
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>

ENOTSUPP is not a SUSV4 error code and checkpatch will warn about it.
It is also not very descriptive in the context of BPMP, so use the
ENODEV error code instead. For the stub implementations this is a more
accurate description of what the failure is.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/soc/tegra/bpmp.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index 822851ef4bf8..a33582590a3b 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -144,7 +144,7 @@ bool tegra_bpmp_mrq_is_supported(struct tegra_bpmp *bpmp, unsigned int mrq);
 #else
 static inline struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
-	return ERR_PTR(-ENOTSUPP);
+	return ERR_PTR(-ENODEV);
 }
 
 static inline struct tegra_bpmp *tegra_bpmp_get_with_id(struct device *dev,
@@ -156,16 +156,19 @@ static inline struct tegra_bpmp *tegra_bpmp_get_with_id(struct device *dev,
 static inline void tegra_bpmp_put(struct tegra_bpmp *bpmp)
 {
 }
+
 static inline int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
 					     struct tegra_bpmp_message *msg)
 {
-	return -ENOTSUPP;
+	return -ENODEV;
 }
+
 static inline int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
 				      struct tegra_bpmp_message *msg)
 {
-	return -ENOTSUPP;
+	return -ENODEV;
 }
+
 static inline void tegra_bpmp_mrq_return(struct tegra_bpmp_channel *channel,
 					 int code, const void *data,
 					 size_t size)
@@ -177,8 +180,9 @@ static inline int tegra_bpmp_request_mrq(struct tegra_bpmp *bpmp,
 					 tegra_bpmp_mrq_handler_t handler,
 					 void *data)
 {
-	return -ENOTSUPP;
+	return -ENODEV;
 }
+
 static inline void tegra_bpmp_free_mrq(struct tegra_bpmp *bpmp,
 				       unsigned int mrq, void *data)
 {
-- 
2.52.0


