Return-Path: <linux-tegra+bounces-5452-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75DA503D3
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Mar 2025 16:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 249A4188E629
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Mar 2025 15:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCE0250BF6;
	Wed,  5 Mar 2025 15:51:13 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5C24EA94;
	Wed,  5 Mar 2025 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741189873; cv=none; b=eL0TFLYJgQxMLX9QchE92G5ZbbAwpF/gzxOpItdS1kVlUcB+rgm5v6HhUCrWOoFpDzFpA4WYrLdnH19kzxxMquJyI0S5j4qC9TEC8lxzg3JaoCDwVhdCd4WqVdBNyN7xmuMbDZn1y1CPqsnh49DQijtGbgeG8W4YfkxzsmIzbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741189873; c=relaxed/simple;
	bh=bcZ3Y1maZR/FkCTZAmhpnI9rOg3F5c8NqHwJtJ8fpwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1HUgGwIWFzvUouB3DiuOjXqQR9/PB+JwzgPIASYmAqP5QIIaeoB9AgZKoKRenGRpkLRE7w+xCLlvX+4sLV86krp2VjiJQDuojgURqhFNelQQj+cuNdc2ZHHTZW38yANH8DbN1FwOaw1igmaiyvjCl0vIOW73bpcrUEezulvnhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowACXfTAAcchnVHqTEg--.44952S2;
	Wed, 05 Mar 2025 23:43:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] drm/tegra: Handle EDID allocation failures in tegra_output_connector_get_modes()
Date: Wed,  5 Mar 2025 23:40:38 +0800
Message-ID: <20250305154038.2062-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXfTAAcchnVHqTEg--.44952S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1UWryxArWrXFyxuF1Utrb_yoW8JFWUpF
	srtFyY9ryktrWFkF1jyF18uFy3uas2kFWUK3s5Ca1q9rs0yr9Fqr45tw1UWFWUGr98JF13
	tanFqrW7JFyxCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUb8hL5UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4MA2fILwlxYQABsQ

The return values of `drm_edid_dup()` and `drm_edid_read_ddc()` must
be checked in `tegra_output_connector_get_modes()` to prevent NULL
pointer dereferences. If either function fails, the function should
immediately return 0, indicating that no display modes can be retrieved.

A proper implementation can be found in `vidi_get_modes()`, where the
return values are carefully validated, and the function returns 0 upon
failure.

Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
Cc: stable@vger.kernel.org # 6.12+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/tegra/output.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 49e4f63a5550..360c4f83a4f8 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -39,6 +39,9 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
 	else if (output->ddc)
 		drm_edid = drm_edid_read_ddc(connector, output->ddc);
 
+	if (!drm_edid)
+		return 0;
+
 	drm_edid_connector_update(connector, drm_edid);
 	cec_notifier_set_phys_addr(output->cec,
 				   connector->display_info.source_physical_address);
-- 
2.42.0.windows.2


