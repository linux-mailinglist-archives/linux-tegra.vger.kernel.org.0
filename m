Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0181AE38B2
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439929AbfJXQqi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:38 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55693 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439932AbfJXQqi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id g24so3594339wmh.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZImZ2aYVtus8sIvpoq9U8jJL9U3kFR2rDXns/Vgt5XE=;
        b=e3YdW4gAuq7BDVpzoPNbRXuhb+yjojW9302LnJrx7BEJmnVsvxyhyMn862RoZBh4Dt
         6Q7zCdjSBcg3HpcmYB2xyM85dtwrZCq3YJ33xKRV+tNN1d+6bUswVcodc6xCt+EUA/P9
         zaC4p96h7ilg5MKZ4pSjvpTITIkB+DdvQqtWSXse1t4am6BnXkqDMKZivwgeE4F9BS2a
         B/a6edUlQ0KBnTLS7O8F4UNA75VegUrbnjqZCFAo4ZdITFcPkX5ZoRf3ASCpT6cMvgU9
         TFTP3dR3mI4CGCvzZCbqMviWka3w1rDXniT7DPX+3uZ3YFj15RAjedhmQvB5Su0N4ywh
         SlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZImZ2aYVtus8sIvpoq9U8jJL9U3kFR2rDXns/Vgt5XE=;
        b=cySnjz96/koAFU/wOYoDpcFcUmv6gLp/VYZ0ezoKLUZC39TFNl6oYrg0w5GJMdzb0v
         z4uy+pBI6XZc74yWIkCB6BxGNHsxJTHlfAzDSatHt/2TYnjakufO96FLa5PinCHDlxr2
         0G+HQZXK0Q3p4AqnQlO3Z0Ii71TGmJohaJlM4vGgH74xGlmW5ld7EzYg0tGOwbT45HB5
         UgGnj7ugDZuidF9N+PevihTBoMYM1qd7txltkfSikBEcTMYKCR+xf/3eFlzvIfezs8lP
         8vOH6bR6aqp2zspBqk2w89yVIhXhac0fMOWnyvus7ZPPxjfPl9hJAF4qxZRkWLVEpAdC
         CZZg==
X-Gm-Message-State: APjAAAVFV2kyoVDvpOv4xH+p8FMMnn85PkaIORPWzKSc7DeeMHtXz3nS
        YUMVfBlcZErAlZjbNdgfcR/bOYjf
X-Google-Smtp-Source: APXvYqyOpLGHJsUa+hisq8WwQTqCNAzEDgyAM1a3TVl4A5vM4r4dOEIwafat4IHDiMZVPKBefDV58Q==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr5528270wmg.47.1571935595921;
        Thu, 24 Oct 2019 09:46:35 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id v128sm4455330wmb.14.2019.10.24.09.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 26/32] drm/tegra: sor: Support DisplayPort on Tegra194
Date:   Thu, 24 Oct 2019 18:45:28 +0200
Message-Id: <20191024164534.132764-27-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Reuse parameters from earlier generations to support DisplayPort on
Tegra194.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index af234d5efbd7..fdbd76ec1cf7 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3727,6 +3727,11 @@ static const struct tegra_sor_soc tegra194_sor = {
 	.settings = tegra194_sor_hdmi_defaults,
 
 	.xbar_cfg = tegra210_sor_xbar_cfg,
+	.lane_map = tegra124_sor_lane_map,
+	.voltage_swing = tegra186_sor_voltage_swing,
+	.pre_emphasis = tegra186_sor_pre_emphasis,
+	.post_cursor = tegra124_sor_post_cursor,
+	.tx_pu = tegra124_sor_tx_pu,
 };
 
 static const struct of_device_id tegra_sor_of_match[] = {
-- 
2.23.0

