Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0D17047C8
	for <lists+linux-tegra@lfdr.de>; Tue, 16 May 2023 10:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjEPI2o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 May 2023 04:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjEPI2m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 04:28:42 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CE2188;
        Tue, 16 May 2023 01:28:39 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3B23B6004413;
        Tue, 16 May 2023 09:28:37 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id Gix-FVt5QXCo; Tue, 16 May 2023 09:28:34 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 7D090600440D;
        Tue, 16 May 2023 09:28:34 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1684225714;
        bh=tasDF3vzLxIEh51dWTH+L5Rs/boGXnCbe1Yj4yQrm0A=;
        h=From:To:Subject:Date;
        b=FDJ9SrFYI4tpQjZtgxmAH69Rur1EQZTH9+9YPV5UAB5JWeAoUnZPKro56ovkdkQG3
         nqmPERZ7bFLqa3cWhZsXvucGckSUi2vorefz+6Y2jzSAUcFpXOEG5c65BZ3ejWUQf+
         rdgimIJKffV6YA28i1LfXgP6ZNgK6y/0yoFP79CI=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 345CC36007B;
        Tue, 16 May 2023 09:28:33 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/2] Enable GPU on Smaug
Date:   Tue, 16 May 2023 09:28:27 +0100
Message-Id: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This patch series enables the use of the GM20B GPU in the
Google Pixel C.

Patch 1 adds the needed regulator DT node for the GPU.

Patch 2 enables the GPU in the DT.

The first version of these patches can be found at:
https://lore.kernel.org/linux-tegra/20230511083101.78516-1-diogo.ivo@tecnico.ulisboa.pt/

V1 -> V2:
 - Patch 1: Use generic DT node name for regulator and
	    GPIO flag defines.

Best regards,

Diogo Ivo (2):
  arm64: dts: tegra: smaug: add GPU power rail regulator
  arm64: dts: tegra: smaug: add GPU node

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.40.1

