Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0711F7A43
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 17:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgFLPBM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 11:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLPBM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 11:01:12 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1566BC03E96F
        for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2020 08:01:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j10so10060657wrw.8
        for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2020 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cSz5jm+X6eXypAq1XruGKtWwjaThxOrkLQ3htBN5MCE=;
        b=PgKYyCjHuqoiMDTLslWjH718dqMqe88MMs+/jKNe5SpENS9DxCPwzd51F9e+RTlTpF
         qAG8bdjlMyox4mDk/tntiouTQseqhV/AYFqqtPLIhZp/KNQfjVohP69elnEdLQJWqdG/
         1c/TrGwFvnswUkR8nb9zgFQjpwFETczzyz6Bg0xM89yJSYiB2ztM2MY9bCjJE+csN76k
         QFnYmXcxhhve77j/CSWT/PMKti/rfAW5NMlxEApkvAaD/XnFwBgZLualyK86SA2D2UAR
         tvYG1vyQFrvGJtSxunrrvKYAhS2Z4cUQWlCiZAgoitCsatn0azV+YDVWoOKavuwvcoIx
         Ah+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cSz5jm+X6eXypAq1XruGKtWwjaThxOrkLQ3htBN5MCE=;
        b=cnConVkpvpFyT2HJqxM7TUjijRwCLGuiAFD4PDBobtZMeU8t9edWoxqL/Eawq6zSlB
         ikCruz6Azx9ZJwAn+bipN8gxxKxB8Nem0up3olJbPG6itapWDaSDaITuaxtfEF1OeKQ5
         eIdXlEa28WqLgZewwwVEkcZsaOwQI+y3LytHscjuk/h6cUCunR13RzX0pDmqG490zVYC
         R5h0MJ4ZjZchqwstaCr1kYpFqawjD9/DdKfl1fHgVfcqnagui6LfuPArVIGn5EgnjfNM
         VzwEg4NRdZL/Xam4hSANEE+fkgZIY7VwguO6C+ltOBnhpcqDu6hoXZgbSnl4W1dEmO4P
         9KvA==
X-Gm-Message-State: AOAM531weTphRU1Ia/r6ZSKEoldNV5Ozstn40I1elkRjTScT/kLWGpjM
        tL0ttWMZiccXbS4h6aLUFWA=
X-Google-Smtp-Source: ABdhPJz5HLzukBhUbrD4+vp7IbSfBgO9Z0gVXVqKCriUmhTOyTMb7ESDQ6b4v5jDvS+u4s7+oV9frg==
X-Received: by 2002:adf:c6c5:: with SMTP id c5mr14765702wrh.13.1591974069006;
        Fri, 12 Jun 2020 08:01:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z12sm11445939wrg.9.2020.06.12.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 08:01:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] drm/tegra: hub: Register child devices
Date:   Fri, 12 Jun 2020 17:01:00 +0200
Message-Id: <20200612150100.2419935-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612150100.2419935-1-thierry.reding@gmail.com>
References: <20200612150100.2419935-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to remove the dependency on the simple-bus compatible string,
which causes the OF driver core to register all child devices, make the
display-hub driver explicitly register the display controller children.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/hub.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index a2ef8f218d4e..22a03f7ffdc1 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -948,6 +948,15 @@ static int tegra_display_hub_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
 
+	err = devm_of_platform_populate(&pdev->dev);
+	if (err < 0)
+		goto unregister;
+
+	return err;
+
+unregister:
+	host1x_client_unregister(&hub->client);
+	pm_runtime_disable(&pdev->dev);
 	return err;
 }
 
-- 
2.24.1

