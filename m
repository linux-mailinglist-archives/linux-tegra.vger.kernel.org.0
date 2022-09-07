Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796755AFF5C
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Sep 2022 10:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiIGIlW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Sep 2022 04:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiIGIlV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Sep 2022 04:41:21 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D354A025B;
        Wed,  7 Sep 2022 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=sYUosvy/IXI+Pq5tayhQwK/KikVpP+HTm3sv+P7XxOo=; b=fmQHaJaqQm6xZdrS0B+IAKKJau
        pK3HLWEH2vdT1KMd7n86LQoxnjFm57zzCBT+OJpNdNWT2xkd0U/je5TozMsurNC9LjZTpGHC5L4kJ
        yuji36t679In32T/22zTnVGOqMxghF2ZghiSjnjHGVr4PqIx0ceTg0DJznAz7HnX3rDae2fVGgDL1
        Mr6hQ3MqY55VMj7kAWmLHXS17MjgoQ2fsfxTPCRaAiWFAr/hrotbMHY0bEafpbWdi2qmNfIey6fdO
        NpJVgT/V8mRuQ+D3oIF4mRwpohyZsZw0w0MIEv/lOxsAr9rbhiqdrgccKEqHXivf7PJpfp9A+YUwY
        5DUv+JSw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1oVqaE-00DbXj-GT; Wed, 07 Sep 2022 11:38:54 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Host1x context isolation on Tegra234
Date:   Wed,  7 Sep 2022 11:38:41 +0300
Message-Id: <20220907083844.2486805-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Hi all,

this series adds support for Host1x context isolation
on Tegra234 (Orin). The difference from previous generations
is that there are two IOMMUs to which engines can be attached
to, resulting in having to have a set of contexts for each one.

Patches should be applied in order. The first patch is needed
so that the kernel doesn't attempt to use a context device
attached to the wrong IOMMU when context stream IDs are present
in the device tree. The other two patches have a compile time
dependency.

Thanks,
Mikko

Mikko Perttunen (3):
  gpu: host1x: Select context device based on attached IOMMU
  dt-bindings: Add Host1x context stream IDs on Tegra234
  arm64: tegra: Add context isolation domains on Tegra234

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 19 +++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.c             |  2 +-
 drivers/gpu/host1x/context.c             |  5 +++++
 include/dt-bindings/memory/tegra234-mc.h | 10 ++++++++++
 include/linux/host1x.h                   |  1 +
 5 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.37.0

