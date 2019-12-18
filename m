Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3648F123F4D
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 06:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfLRF51 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 00:57:27 -0500
Received: from mail-m972.mail.163.com ([123.126.97.2]:35158 "EHLO
        mail-m972.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfLRF51 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 00:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=BulQTA6G1N4TWHEAvp
        OsyuqFrzbeQQmLPGWhFy4BohA=; b=XRJUCRbB0X3DC2/ZWr5mhVoutDzXnQaiEt
        WgrdPoK52rCc6FT37BGdo8Hhrvn2tMTeTA0OnEvtoK44npKsg7WF10/hfhZQLKBG
        CzR4vDrxolydO3b0qEmiKwWiYHEOoW0U4F+dPnzZ3csAD9CqAV4qYCXI1CvXqGqy
        /IL6HA/1g=
Received: from localhost.localdomain (unknown [218.106.182.184])
        by smtp2 (Coremail) with SMTP id GtxpCgBnMzqbv_ldmP0WAA--.443S3;
        Wed, 18 Dec 2019 13:57:01 +0800 (CST)
From:   Xidong Wang <wangxidong_97@163.com>
To:     Xidong Wang <wangxidong_97@163.com>,
        Marc Dietrich <marvin24@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] staging: nvec: check return value
Date:   Wed, 18 Dec 2019 13:56:38 +0800
Message-Id: <1576648598-12257-1-git-send-email-wangxidong_97@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: GtxpCgBnMzqbv_ldmP0WAA--.443S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryxWw1DXw4Uuw4DJr4Utwb_yoW3ZFX_Cw
        savw1xZrZrArn7Ar4qywn8ArW29rWfWrs2qr4qg392vayUur4Sv3yDXr1DC3yUW3yxGrW3
        uFyqkr4ayr13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFAp7UUUUU==
X-Originating-IP: [218.106.182.184]
X-CM-SenderInfo: pzdqw5xlgr0wrbzxqiywtou0bp/1tbi8A2P81uoWGCDAwAAsK
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In nvec_kbd_probe(), the return value of devm_input_allocate_device()
should be checked before it is used.

Signed-off-by: Xidong Wang <wangxidong_97@163.com>
---
 drivers/staging/nvec/nvec_kbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index 01dbb66..386d619 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -123,6 +123,8 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 		keycodes[j++] = extcode_tab_us102[i];
 
 	idev = devm_input_allocate_device(&pdev->dev);
+	if (!idev)
+		return -ENOMEM;
 	idev->name = "nvec keyboard";
 	idev->phys = "nvec";
 	idev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REP) | BIT_MASK(EV_LED);
-- 
2.7.4

