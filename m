Return-Path: <linux-tegra+bounces-5439-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C7A4EC16
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Mar 2025 19:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 733E41892D6F
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Mar 2025 18:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B2627FE7F;
	Tue,  4 Mar 2025 18:32:00 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A79E27F4C4
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741113120; cv=fail; b=GO4emIhMb/s52ZeDEQEDM5Anp3w8H1rQX9C+479rj+K2EXNSbGXbw1BuNvYcq5hneBNZ9DDH9ctR+LCxswQHVT3yTd0yJNmdwauCoEhdptpLf4iZO1lWoNgJoWYedwULtkFX5nEUgA7IzCVGWkocnVD9UozH8PsjxUG63wL0/iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741113120; c=relaxed/simple;
	bh=afaNn7bQBqwP5EyP5AoJcdnHL2DHIHUStLtpr/Prcnk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jqygx/3SvqazbEO2U1WIiKc59/2ZZ4r2f0gmPqfdLmdF3sbKgeqBlp/smTDeTq3DmuQvBEJtUlKxmkPa6Janbfza8CsKxNd3K0N6JfdE1KTmPGV/itdn9INPUd0NW0URwU90A8S/cRfhCOMwk08u9EXg4/lran+tb0LshAkdk6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=none smtp.mailfrom=cc.itu.edu.tr; arc=none smtp.client-ip=159.226.251.84; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=fail smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id A8BC440CFB67
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 21:31:55 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6flL69KpzG0ZH
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 18:30:38 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 7E70C4273B; Tue,  4 Mar 2025 18:30:28 +0300 (+03)
X-Envelope-From: <linux-kernel+bounces-541093-bozkiru=itu.edu.tr@vger.kernel.org>
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 78184425A4
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:28:21 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 4F03F2DCE4
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:28:21 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37FC71891758
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5211EB9EF;
	Mon,  3 Mar 2025 07:28:04 +0000 (UTC)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E61E8327;
	Mon,  3 Mar 2025 07:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986883; cv=none; b=QkM4Y73o/TpBElBS7bMsKXzgBQzOGe1QtFn5PN162s7lpalCM5rSebA5omqnx4cJQoB9bDcYmX51HoMmpHCbYVELz+gKOtXdKU++PTSHJ/3m4sjiP0W7pZIQt4y2ajjBPwUuoRZmNss5RaeoUdzO419ib0Z8NCgKgdfVDzaf/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986883; c=relaxed/simple;
	bh=sS6epZ/Q0dmr2tgVut1X+sY8gavr366YXLTOVDwcdzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a8Tk1+AVPPfrxp0ILU2DDPo5BdTqkvN6nWbEioA8QEsBcwnk0TPkUSKQJ/APAe+hfQnhJHpzOAudLwKNXodaHWtmvQ8eVGULDQFbheaSdYHKCaCswTyg30d3702xBF27SwfxbuU923TMhbpWrrUnZe4bz0hAzcB7uNkHgaR0xUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowAC3vaHsWcVnWs+uEQ--.52938S2;
	Mon, 03 Mar 2025 15:27:47 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: jckuo@nvidia.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2 RESEND] phy: Fix error handling in tegra_xusb_port_init
Date: Mon,  3 Mar 2025 15:27:39 +0800
Message-Id: <20250303072739.3874987-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowAC3vaHsWcVnWs+uEQ--.52938S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4DKFWkAF15tFW3Aw4fKrg_yoW8XFyDpa
	1DGas8Kr9YgrWkKF4jvF409Fy5GF42k3yrur1rJ34akrn3W348tas8trWxXa4UArZ7uF4U
	ArnxJa4kJFyUC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF0eHDUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6flL69KpzG0ZH
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741717801.71898@DiYjR/tItB3Yt94XI/RBIw
X-ITU-MailScanner-SpamCheck: not spam

If device_add() fails, do not use device_unregister() for error
handling. device_unregister() consists two functions: device_del() and
put_device(). device_unregister() should only be called after
device_add() succeeded because device_del() undoes what device_add()
does if successful. Change device_unregister() to put_device() call
before returning from the function.

As comment of device_add() says, 'if device_add() succeeds, you should
call device_del() when you want to get rid of it. If device_add() has
not succeeded, use only put_device() to drop the reference count'.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 53d2a715c240 ("phy: Add Tegra XUSB pad controller support")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- modified the bug description as suggestions.
---
 drivers/phy/tegra/xusb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 79d4814d758d..c89df95aa6ca 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -548,16 +548,16 @@ static int tegra_xusb_port_init(struct tegra_xusb_p=
ort *port,
=20
 	err =3D dev_set_name(&port->dev, "%s-%u", name, index);
 	if (err < 0)
-		goto unregister;
+		goto put_device;
=20
 	err =3D device_add(&port->dev);
 	if (err < 0)
-		goto unregister;
+		goto put_device;
=20
 	return 0;
=20
-unregister:
-	device_unregister(&port->dev);
+put_device:
+	put_device(&port->dev);
 	return err;
 }
=20
--=20
2.25.1



