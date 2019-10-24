Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6407E3893
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436846AbfJXQqI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:08 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39996 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439894AbfJXQqI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:08 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so2096100wmm.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v7sIBy+NeFxNLTjK62J325/VvVdEVUMB1reiPu3pIc8=;
        b=h2AkK8Fk42hDKnysvCBeOGI1jEnFs/G/r+XJcTwS4ymT5ODIFNyQGWEPknw1kx6V1i
         QvibakSkAbdHHpT/L0egKH5XsGcX3ntr5VS6QASDLiVIMdWCu/qyhl3VPTjyxxWlZeqC
         cOq9PCsJoRIxzwcVaEr8zdDrUnLtzWVS6j8cwzry2JAghgu4Mqv195T3aqMefkZXmqOq
         tuXucWEQY6Bu+nxz1OKB7RiMKmlmG1QvfI2QQgnC41DDD0SnD0WyaFqc99T0fe/TVlVR
         GmwRL/ZxJxF70qpNaXSAIoTzag4cTjaKdDo3vvHKZp5iXkdpMtg0l5JksOTvwQi8KN8s
         sTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v7sIBy+NeFxNLTjK62J325/VvVdEVUMB1reiPu3pIc8=;
        b=Q+cyDTNd0XFFzXw6qo8Em/hoDiG2gEZQN2mW9MOQ/DfXCY6VWgRNyCv//0KVPLtjGf
         BPnyDC6wczc4JYSNLeXnTmRO77YPJn9XADgvW07C9S3jqKVS0fDKaHtA6ph52HGdzYny
         WeZdnkLcSvRfQkVmOmxdWq7YBjl2oUs2xpqiTm8I5PIWwTVBm2agdUotPaGM3fXfQcvj
         XOCYP385+3WLRd+gDHGWkpG8m+dS+tZIja+diyggmap89U+ZDS48Th4oyCmMFBq7SnB0
         fAyrcMDnrIS1lK6ZZ9MAfN4jfP4SjBwLM6moJBokefJ0qrSsLJoQ7/VRO+j6qBnkULTv
         P+jA==
X-Gm-Message-State: APjAAAXXlYCpb07MI+jKoFsuyEDaRgeSNeFCMaabS6NG6rT9nVJbV7jU
        cMCPzUgoTSZX434I4LxRfqx+Fx6J
X-Google-Smtp-Source: APXvYqzNMQfQSe21eo66v5s9QJVWKaQWzPmmQo+HbPGXpXR1lqS8E7bqjTx+spu0jHtb5iCHVx5TQQ==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr6063460wma.81.1571935565957;
        Thu, 24 Oct 2019 09:46:05 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id r3sm42193380wre.29.2019.10.24.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 13/32] drm/tegra: dp: Enable alternate scrambler reset when supported
Date:   Thu, 24 Oct 2019 18:45:15 +0200
Message-Id: <20191024164534.132764-14-thierry.reding@gmail.com>
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

If the sink is eDP and supports the alternate scrambler reset, enable
it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index ca287b50fad8..638081b568f4 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -225,5 +225,12 @@ int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	if (err < 0)
 		return err;
 
+	if (link->caps.alternate_scrambler_reset) {
+		err = drm_dp_dpcd_writeb(aux, DP_EDP_CONFIGURATION_SET,
+					 DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
-- 
2.23.0

