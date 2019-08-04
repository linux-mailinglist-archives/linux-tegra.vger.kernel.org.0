Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8073280A1C
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 11:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfHDJlz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 05:41:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35013 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHDJlz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 05:41:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so76764633ljh.2
        for <linux-tegra@vger.kernel.org>; Sun, 04 Aug 2019 02:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dafJ51pWjlSMMKmje8uyWBSzlpRZ3vlrMRQDfaXXm+I=;
        b=VJKKuspPkJ/iptGVaAIoL945E1CzQwsN5G4ksjAZNP8PXf2Ff3dv+gS/FLoY9VWU05
         w8q3mWa/IuxNK47fbQt2rYa73+ocaMbglQIKs1eqXhDFXafeznzGsR4vzux/6sUs20cD
         QjFlISCWneiUfF/0n368zWU8jpTJViwhxlySi37hox1yoPBK1PakzLZMcLniiNyUUAUC
         eOpmBnh7ej7+c/ZGjO1NUUNb4yvPp83pOztqSDOCfPjub7MbSJtYi2qbl1MNb9j2Qh1i
         3uT8JZ0BBiAxUZPdS6iwJpVZXJ3441zFnjxXTFiKqzfecyfHwQWuKq6C4KSnDoXI92Mo
         99Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dafJ51pWjlSMMKmje8uyWBSzlpRZ3vlrMRQDfaXXm+I=;
        b=iBljMGixUb/rwmfM/5QuCZo5//9c+CoTIKTwl5iTl05VyV+6/Bbk77398h2agK1q0a
         s0JGbsljOiEJg/ShYhz/F8dPdWU8ykSp7BIlNRGOZo2QWQP1rDoSFW0kZAJdMvJZOF/z
         pJj+FpKrhLLpXKlLkvbjlXfaVFHnjYR2hF5pOvg/fFPdr/Qo9Q+dobC5Un4YKZL2fHHm
         eiS1nWNcUDzv4HkZGWQCJ527MGPi2gbijnrzuK+BaueG5sE/fr0+voPxdFFu4mZx1Iq1
         gbQObe2NLmQ5Qo5rarMGrYZaa1snwBr2AKl+1T4uAMoqrunsToG6mYCibRbfCDxLAPRi
         r8NA==
X-Gm-Message-State: APjAAAWhnDxksWX9FD/pAQ/Bol+eQqoiA8f5QUh3Yqa7LdAM+FlZcvi0
        liYeiEt0Tb71gBymtPTvLTk=
X-Google-Smtp-Source: APXvYqxKvDIXNk5hC0HOtNDMbpuXDXA801J8FRJXWqD4g6qi8xlCjntuFwmXiY7iKqOVHtMV0EPP5g==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr75925007ljj.122.1564911713008;
        Sun, 04 Aug 2019 02:41:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id 25sm16230194ljn.62.2019.08.04.02.41.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 02:41:52 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        malidp@foss.arm.com, Russell King <linux@armlinux.org.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/4] drm/i2c/tda998x: drop use of drmP.h
Date:   Sun,  4 Aug 2019 11:41:29 +0200
Message-Id: <20190804094132.29463-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804094132.29463-1-sam@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Drop use of the deprecated drmP.h header file.
Fix fallout.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 61e042918a7f..84c6d4c91c65 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -13,10 +13,10 @@
 #include <sound/asoundef.h>
 #include <sound/hdmi-codec.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/i2c/tda998x.h>
 
-- 
2.20.1

