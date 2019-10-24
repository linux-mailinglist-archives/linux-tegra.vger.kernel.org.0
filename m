Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A202FE389B
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439901AbfJXQqU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54528 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439894AbfJXQqU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:20 -0400
Received: by mail-wm1-f66.google.com with SMTP id g7so3595128wmk.4
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t2AaSAVqpbDL04En9DdcntuJXoHrsGRIQaneDm/xPB8=;
        b=G3twkFZ2mXV/rLLmlkVA04C7g/kJioutmqx7VJWaFEkPh7Bx/z+g3/63gG12vQEYzL
         lrnuPYLxPkqmK6V8+gRewfRtZgJ5VZQZtE9tNGh77vt3V8wbrL2ZMyTvyyegG9R0a77F
         TRWbHZp5dfpzBbLZmS3i+g6538kXX2GM08zAM4WQi/tq4JMrmczCA6obAJXlAiMEl/WG
         olE9mhDzBhdETOOjZHo9ZzvAohsQRKWEGC1L4xaTPH64/LRw1OzvVXbduQSxcyCHUSuX
         CVhRUUtBFDBSNLjnYEglPnxBO05n27n+jFGpp226y91XKVwas3/7rFq9SgbIgm/yCQ6I
         8+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t2AaSAVqpbDL04En9DdcntuJXoHrsGRIQaneDm/xPB8=;
        b=Ke+05K6l1KZxyIgw9SkWJvfWYPmcugpwmgsnmSND4zWgEhSe3p5LabfbSVtgw0eN5z
         KHrGB2BfDAXX3XQzV2EdwGp9qJSQQ4RdG82aeJwNgLj01+XrdJpChjm6JIFU8XlZ4Wwl
         iFakLsMXbSBQRdXI/mzs5axH2RlmwzMTji+tsyksUHCZDByzfYov9JCUEN4znvdxfeWC
         MnVHHfzKlsx91B4I0jhQswLiLCar2zPvrttaAeuTtVDEd/VfKENCFwy1bvi3rWm7skrH
         eYY6PEb2SFwMEJoG7QxCeohccINX5EwTuGatB2Gr1PTIO6CqZYvhPrr4tVxzgAAo211G
         vjiQ==
X-Gm-Message-State: APjAAAXNK3OqiNJWc8AZcx1IKhKT1YIscPuHfn0R8T2gwHSjwei+p9Vs
        1MrrcEgWc1vvKNZlrLRuaK4=
X-Google-Smtp-Source: APXvYqy7rcaOm0vrlMBYNbbmx6UJLakTaiIUDoQkKpFg2C2Z5vcT45qLo+YnNhjrRvUuuqbrqKh7Cg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr5674271wmj.126.1571935578299;
        Thu, 24 Oct 2019 09:46:18 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q12sm2627267wrj.87.2019.10.24.09.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 18/32] drm/tegra: sor: Hook up I2C-over-AUX to output
Date:   Thu, 24 Oct 2019 18:45:20 +0200
Message-Id: <20191024164534.132764-19-thierry.reding@gmail.com>
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

This is necessary for the output abstraction to retrieve a list of valid
modes from the EDID of a connected panel/monitor. This will be useful in
conjunction with DisplayPort support that will be added in a subsequent
patch, so that the driver can read EDID via the AUX channel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 636807e047f0..6f979c5fff7b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3524,6 +3524,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
 
 		if (!sor->aux)
 			return -EPROBE_DEFER;
+
+		sor->output.ddc = &sor->aux->ddc;
 	}
 
 	if (!sor->aux) {
-- 
2.23.0

