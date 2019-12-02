Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F3410F277
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Dec 2019 22:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfLBV5n (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 2 Dec 2019 16:57:43 -0500
Received: from hera.iit.uni-miskolc.hu ([193.6.5.4]:46596 "EHLO
        hera.iit.uni-miskolc.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfLBV5n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Dec 2019 16:57:43 -0500
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Dec 2019 16:57:42 EST
Received: from localhost (localhost [127.0.0.1])
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTP id 084AD1B3D;
        Mon,  2 Dec 2019 22:52:22 +0100 (CET)
X-Virus-Scanned: Kamavis at iit.uni-miskolc.hu
Received: from hera.iit.uni-miskolc.hu ([127.0.0.1])
        by localhost (hera.iit.uni-miskolc.hu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YMw1GiuZXysi; Mon,  2 Dec 2019 22:52:13 +0100 (CET)
Received: from titan.hitronhub.home (unknown [IPv6:2a02:8109:a180:2298:f5f6:6861:31b7:8595])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: szucst@iit.uni-miskolc.hu)
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTPSA id C589D1B36;
        Mon,  2 Dec 2019 22:52:12 +0100 (CET)
From:   =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v2 0/1] arm64: tegra: enable SDIO on Jetson Nano M.2 Key E
Date:   Mon,  2 Dec 2019 22:51:59 +0100
Message-Id: <20191202215200.9656-1-tszucs@protonmail.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

It turns out SDMMC3 on the Jetson Nano module is wired to respective pins of
the carrier's M.2 Key E socket. However, it is not enabled. I see no reason
why. This block is functional and has a fixed 1.8 V I/O supply. Perfect for
SDIO cards nowdays. I think it would make sense to enable this feature. PCIe
could be used for something else.

Kind regards,
Tamas


Tamás Szűcs (1):
  arm64: tegra: Enable SDIO on Jetson Nano M.2 Key E

 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.20.1

