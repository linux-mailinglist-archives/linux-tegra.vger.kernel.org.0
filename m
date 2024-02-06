Return-Path: <linux-tegra+bounces-694-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7C84BE1C
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Feb 2024 20:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4C601F25381
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Feb 2024 19:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B8F1401F;
	Tue,  6 Feb 2024 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AFdOzT0h"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6F17BC5;
	Tue,  6 Feb 2024 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707247827; cv=none; b=G5lobi1Js6tlEfyippMNgayw889S1qnsMG81qYhtSnY/h/3S52LpyDrHSOJlxpWMpmFPt6/Gki52kZlmcXLJaY8PYCPwRFDyJa6c4PapO+e0DyemuXWi/fVbF9H7kK9jm90+N4FSSi6W6WomUg4BHJ4R7XtY1aLTiR7IxelFnhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707247827; c=relaxed/simple;
	bh=hi0BT47m6ZyBheedy6RSpVulWOf5VI5WWIZe5wNvktc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SIsowqx7S+m99U5Liu2Vp+RACWpMFR2kKaYrMEc4ZsiSOMBa7t0uWQQtFMRr2zdR1ikY3J1wOUevqYLpeqhRi53uODl/VPwMe6dEiYXIFl9rjl4UDOvBpQbO2XwI+oUxX7kdxkzIUinbiv5oMYyvQEW1CAGciJ3vIY9jIu9aWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AFdOzT0h; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1707247816; x=1707852616; i=markus.elfring@web.de;
	bh=hi0BT47m6ZyBheedy6RSpVulWOf5VI5WWIZe5wNvktc=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=AFdOzT0h3oqTBgn00LiRwdbL/4B+PXCN6St4kmqNToB1MrhUnPK5dvBUnKiqymOb
	 1wzbmqpWAvwjp24ju4Vqcgyor9jionuE/QOtHte9DIwfUynb5ka1NNHck9UerwCEQ
	 63+q4xBeKju/PQ0P63PY5EsSAVj5Ju+NV/O0u/ZS7G9jgK5xiq9ktffoJzYk/iCp4
	 pz0/6uSN2cDr6ae39vPcLqrcGRQcKLgQyjtacRslevRNhwwFIbtJvrVtici7H4DwI
	 WT+Y3wgZ6S7x+p+/l1DVOw4C2KFXupJJJufURY12BkFNwG9rePraY1SkFhIIdv64m
	 szZ/90HEK6dZ2YUjMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHmq2-1rlFCY0P3O-00EsQQ; Tue, 06
 Feb 2024 20:30:16 +0100
Message-ID: <2ee2acc5-dce4-4e79-8f4c-f64f806f2e40@web.de>
Date: Tue, 6 Feb 2024 20:30:15 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] drm/tegra: dsi: Use devm_platform_ioremap_resource() in
 tegra_dsi_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <c2e4aaa9-731f-4a33-890e-567c466a8885@web.de>
In-Reply-To: <c2e4aaa9-731f-4a33-890e-567c466a8885@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P0c1I0GGVWIPRIqGbF/0oVUMwLjd5lT+AEWpvtbuRHfrDaVev3s
 9waL07qfdivt9+Kme3XYPma+E4Cbil0jtMr8m6RuEkW4T757xIKBdY7eP47OGByZswOAhgq
 kHJNDHWs2T5TPlJpvuB2RnkAAC+K+qCyIcdfHjlof+zbiGfHSE1qJAcEPrt7MoK+bpDMHQw
 MNMKjUWS+w+kBr5zV9HFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AIcDvYb5rFc=;e/6xf5MXkUbbLJSuBtz57g4YovD
 6xRXcUIUwUTbTkjvldGqX19asM26PXdTkgODzuKSRaapUS0OYYwpT1dyPq7qTNlqckMEtJXvF
 ULYGlxLSjFMpAQ461esEvH2Vrd2V20rDjDv6Fc/vxctrQVkPi2cwbg3LhIR6xDlbbZDN3J9Un
 INoXUGPTt0PBf4c1DYaZM91+feIzMuhiA1VG8m18NdffzkPmtNkYRX/5JJ8cwwOBsxKjJ00u5
 pGJTvncnF94ix7H74tz2pM+UeUTGytap4bH7mONlYo0d+mfV9clgF+g5AYXGfNec75OEpFjnb
 f8yr/AY1u5aIgQBPpjYC9fOulVNqMn9zHX6cyV7J+s+nIZLBnHIB9mPWXlmv9+I4KetLJX/pY
 0r7DJr2l7RLByMK/Ys3MR9d4T2blss/9VrexUXa6vqdSh/7dVOwiU0x+blDdZJ1ifkKPYKbGh
 vnix+N6LZMHjsq7lFKVdiAfY+FE4vcL3bgXuW9BADtdFpo2Xr/4MrcimVePWYcRFxwbTK6GGe
 FhifFGQ6tarQCv0AgTpjevobHrGsd6HxUntumJkPv6a4D7wtfgn31ApoH2nPYgPE/yFECiG+o
 JvoMTFduECrVmuZwSK8pl+XyfCPcNGD/PunZPrkka+UjLF34ZyOaCusWt7cXHTBxwKo7rhnSN
 pl9E2D8nbWaqUX8SRce1NviWvOL1AwKowormyZJlP908HI2+//vDvkgJwwqt03Y5RHJNpWe4d
 FCcg4neLOxCNoZEKWMfpWZ3xnyITZkb0HvgN06wP86MsrQlfp81Sm+NtbP1+/apJTnz1HNQG4
 sfBEduy8Vo6329GMOdjXecTB2c/sRvm6BtmIE5sMDC5d0=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2024 20:22:56 +0100

A wrapper function is available since the commit 7945f929f1a77a1c8887a97ca=
07f87626858ff42
("drivers: provide devm_platform_ioremap_resource()").

* Thus reuse existing functionality instead of keeping duplicate source co=
de.

* Delete a local variable which became unnecessary with this refactoring.


This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

v2:
The transformation pattern was adjusted based on advices by known contribu=
tors.

Examples:
* Douglas Anderson
* Geert Uytterhoeven
* Robin Murphy


 drivers/gpu/drm/tegra/dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index fbfe92a816d4..f9b6b5428b66 100644
=2D-- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1562,7 +1562,6 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *=
dsi)
 static int tegra_dsi_probe(struct platform_device *pdev)
 {
 	struct tegra_dsi *dsi;
-	struct resource *regs;
 	int err;

 	dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
@@ -1624,8 +1623,7 @@ static int tegra_dsi_probe(struct platform_device *p=
dev)
 		return err;
 	}

-	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs =3D devm_ioremap_resource(&pdev->dev, regs);
+	dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->regs))
 		return PTR_ERR(dsi->regs);

=2D-
2.43.0


