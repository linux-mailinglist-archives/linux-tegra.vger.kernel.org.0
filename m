Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 239C711024D
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfLCQaC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:30:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38085 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfLCQaC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:30:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so4454097wrh.5
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zaSjdjjHF8C8+w85wefmLYd2L9dUshbd+yUVIXEIO0Q=;
        b=FOkbWEz7emVE46TomWiu3oD36RAQzhv+zRD4kcD2pe2kkuHGTJhYAB/7/mFGX05apc
         KMsGkU3IqZ2qIOF1KDe1U6jQ+Qkwzj84PG3844NS8uIuWw8yFUhYNdWkhy/fwGaqqGjT
         TTcJNN2BJrW6mj5JWsCOu+7rdY9YlLA0cesSBh4k4tvuAOhosLwcWG3NQGUK4MKHf4k4
         ZU2xpblt5XHui//mhXVdlDaAx5vwW0T7RpY/pqBTw0clzOmFSO8OhdULfRpkd7WM8CPk
         MLQRETB0DOD6LB1O+kwqkofmb7rfQ/9XkE4cVuKwg3HUdcw6IbilN6YD3dYKazEv0AZg
         zyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zaSjdjjHF8C8+w85wefmLYd2L9dUshbd+yUVIXEIO0Q=;
        b=UV9h3aBzGkqf+XLZb7EpAkCKPTwMEUv363bTEQIdBicUSogciVQr0VnwOjmOjjuSxe
         8ZcER80m60EAOW1Ad1dOKV4kc23OmHYyCcJQy4M7pGwXQ4FHF+YOeCkVYoAvFQHqh+z+
         tm+XXaMNl+fd08YB/jdr6fSmor8ujJrwD91qtKhFfqHSM+cgJ8BSuH7cW2Ca7itrj/QL
         I6HkJ/Qs35EY68gOE6F8TNKDJtTcy73dun5wZ9aIrWuHFthQDw3Kd98POAyRV0wqajhN
         ylF94C2ck6us49DqSnYcScvNNaFzR2h3oLNqanv7KguJT3f/0frhqy72rPcCi3fqVxDB
         ILwQ==
X-Gm-Message-State: APjAAAUelw+nXKrEgbASSR9NW3+7YESPKs8hIlYJeLRF9yaX3vbAhbTl
        VyKac1rhkp0K0Eq5SPvQ9IQ=
X-Google-Smtp-Source: APXvYqwNbpQvjg2dXko3xhzf7ho/KJI8CqjxHZ2JvEfhjHiV++UgmaGMUswDcW7mROEshIzY4/eeHA==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr6306849wrn.239.1575390600513;
        Tue, 03 Dec 2019 08:30:00 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l204sm3679609wmf.2.2019.12.03.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:29:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: output: Implement system suspend/resume
Date:   Tue,  3 Dec 2019 17:29:57 +0100
Message-Id: <20191203162957.1467114-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Implement generic system suspend/resume functions that can be used with
any output type. Currently this only implements disabling and enabling
of the IRQ functionality across system suspend/resume. This prevents an
interrupt from happening before the display driver has fully resumed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/output.c | 16 ++++++++++++++++
 drivers/gpu/drm/tegra/sor.c    | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 34373734ff68..57203030dd02 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -250,3 +250,19 @@ void tegra_output_find_possible_crtcs(struct tegra_output *output,
 
 	output->encoder.possible_crtcs = mask;
 }
+
+int tegra_output_suspend(struct tegra_output *output)
+{
+	if (output->hpd_irq)
+		disable_irq(output->hpd_irq);
+
+	return 0;
+}
+
+int tegra_output_resume(struct tegra_output *output)
+{
+	if (output->hpd_irq)
+		enable_irq(output->hpd_irq);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 200d99e17afe..572e18545505 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3995,9 +3995,16 @@ static int tegra_sor_suspend(struct device *dev)
 	struct tegra_sor *sor = dev_get_drvdata(dev);
 	int err;
 
+	err = tegra_output_suspend(&sor->output);
+	if (err < 0) {
+		dev_err(dev, "failed to suspend output: %d\n", err);
+		return err;
+	}
+
 	if (sor->hdmi_supply) {
 		err = regulator_disable(sor->hdmi_supply);
 		if (err < 0) {
+			tegra_output_resume(&sor->output);
 			return err;
 		}
 	}
@@ -4016,6 +4023,16 @@ static int tegra_sor_resume(struct device *dev)
 			return err;
 	}
 
+	err = tegra_output_resume(&sor->output);
+	if (err < 0) {
+		dev_err(dev, "failed to resume output: %d\n", err);
+
+		if (sor->hdmi_supply)
+			regulator_disable(sor->hdmi_supply);
+
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.23.0

