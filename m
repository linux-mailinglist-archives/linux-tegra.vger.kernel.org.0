Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F351CF7C2
	for <lists+linux-tegra@lfdr.de>; Tue, 12 May 2020 16:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730239AbgELOso (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 May 2020 10:48:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:35678 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730211AbgELOsn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 May 2020 10:48:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0E9E4ACC3;
        Tue, 12 May 2020 14:48:44 +0000 (UTC)
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     swarren@wwwdotorg.org, robh+dt@kernel.org, robin.murphy@arm.com
Cc:     devicetree@vger.kernel.org, talho@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, afaerber@suse.de,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH 3/4] arm64: tegra186: add reserved-only flag in sysram node
Date:   Tue, 12 May 2020 16:48:02 +0200
Message-Id: <20200512144803.24344-3-ykaukab@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200512144803.24344-1-ykaukab@suse.de>
References: <20200512144803.24344-1-ykaukab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

bpmp driver has reserved regions in sysram. Since sysram is only used
by the bpmp driver, add ‘reserved-only’ flag to the sysram node so
that only regions used by the bpmp driver are remapped. Other regions
of the sysram may not be accessible to the kernel and a speculative
access to them can cause SError.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 58100fb9cd8b..07ce7e7b270c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1219,6 +1219,7 @@ sysram@30000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges = <0 0x0 0x0 0x30000000 0x0 0x50000>;
+		reserved-only;
 
 		cpu_bpmp_tx: shmem@4e000 {
 			compatible = "nvidia,tegra186-bpmp-shmem";
-- 
2.25.0

