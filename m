Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5F04D46E
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Jun 2019 19:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfFTRBB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jun 2019 13:01:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50179 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732017AbfFTRBA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jun 2019 13:01:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id c66so3815106wmf.0
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2019 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7xKRcghk6K9wXD2NuSjK2ZbUH/YI2Xo2Km49x7MrLqo=;
        b=RKvDlAk/djPz2hB8AcduZ8LlM8CtF4h6hy5RVu7k6dWaWaEuGzXQ8HrwL9fwYus5Dl
         52louvfEvVIC1ukMf7QbxCTNQLN9bWWypQygWc3tPbzTcXoix9wnamdtZjSzzlOLZEjt
         t36etBwvTBrZ2crV+lSWWqaTAlkQLOsW6nKp8SWBaaGLxtfNOzBcwywyvpINc64GxUNA
         X06wpvYDRjYpkZcdDk5xBKGL4zte0n6y26IzCFleMV8TbA55yc8PGHXkO2egyhYwL/4R
         BO4In9S2n4WyySrA5p93wZVm35wr3f56BvP+zAmbDFSKHs8eNCyLgSFslJzQFxbrjck0
         GH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7xKRcghk6K9wXD2NuSjK2ZbUH/YI2Xo2Km49x7MrLqo=;
        b=jE+p60HFCeJUX2DTnaOLy4ci3pCdMmqKjCcN9KDr+9+MIiUwr2HLESYsV1QrXU/IP0
         Lto017gVxtgxFkX1PXVaqrE3Q7dlLx2xbv0kfOO7rQmasrvuQ7plAYOCt5lhrJ+kAwSL
         xxlAJ+bDZu4jYYIDF+MqT7+V0hdk8fXS6IwujVgDdcioD3WshTYp0Gv9nIpr6RCFsTWA
         B6EmszzUb+Irr64X8ixCzQUCjM1qI/lu+lrxDO++jJETAkokIVBcJf9/x60Vk8qpXr1F
         wZQzi9dFqPUf5pSt3+cNcMNBMsPSXa1XGYnsUUZ78HHR/xaeoDRt26eIogStiSG1ZaGq
         XNGA==
X-Gm-Message-State: APjAAAVkMfv1efNOrXj5KGiaaOXc4rHFn+9LsIaa67i9GL6oR4o6jAfi
        QB8XVnPnCXbjY0KAaw1ZH5s=
X-Google-Smtp-Source: APXvYqx/+ZnWVzCd6NnRgECpRWd3OnzkWTbaxTj7YACHnm8Gehhbhchk8pKfmYMjNYcM8wj706si4w==
X-Received: by 2002:a05:600c:2189:: with SMTP id e9mr394437wme.56.1561050058578;
        Thu, 20 Jun 2019 10:00:58 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id p26sm294909wrp.58.2019.06.20.10.00.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 10:00:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org
Subject: [pinmux scripts PATCH 2/3] Do not output NVIDIA as an author
Date:   Thu, 20 Jun 2019 19:00:54 +0200
Message-Id: <20190620170055.19771-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620170055.19771-1-thierry.reding@gmail.com>
References: <20190620170055.19771-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Printing out the string 'NVIDIA' as the author of a file looks somewhat
strange and is pretty meaningless given that there's already a copyright
from NVIDIA in the files. Detect the special case and ignore it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 soc-to-kernel-pinctrl-driver.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index 37f34b15db2b..0c04625b2e87 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -44,8 +44,13 @@ print('''\
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl data for the NVIDIA %s pinmux
- *
- * Author: %s
+''' % soc.titlename, end = '')
+
+if soc.kernel_author != 'NVIDIA':
+    print(' *')
+    print(' * Author: %s' % soc.kernel_author)
+
+print('''\
  *
  * Copyright (c) %s, NVIDIA CORPORATION.  All rights reserved.
  */
@@ -62,7 +67,7 @@ print('''\
  * Most pins affected by the pinmux can also be GPIOs. Define these first.
  * These must match how the GPIO driver names/numbers its pins.
  */
-''' % (soc.titlename, soc.kernel_author, soc.kernel_copyright_years), end='')
+''' % soc.kernel_copyright_years, end='')
 
 # Do not add any more exceptions here; new SoCs should be formatted correctly
 if soc.name == 'tegra30':
-- 
2.21.0

