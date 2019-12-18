Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC3312507F
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfLRSYB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:24:01 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44390 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfLRSYA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:24:00 -0500
Received: by mail-lj1-f193.google.com with SMTP id u71so3216607lje.11
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vlieLBRBUVyp74ZXuf3VA2mlBE47lQESjmpcCr1ryl4=;
        b=eWbspfibpfXbeZuWaxhoymIbqIeWLu4xMn43AK/lI4QZvMfXFgGvL6TEMxQODEqyUN
         /h6VjsG10bPFqqXURR+pV1acOyHyoMMBZUoU3+4X5y3B36taHbxukgp2Ftj6JddrFXzB
         dX2dfOL2dY1TWlSTTQ1AYRSkOC09QzSYQQP6sYPAuJsvclaKHSEemAQnrJx6hkrO9/eQ
         6Dvzr40TvQpCRaBRB2Vx0rg5OrTogYOcrUsb7PvLDzjpY4xoH3msQlZuaYYrALq7a1Zy
         TZFHeA8KfJvsaYrfGtxZYbbZaUOe4NCLVtf3wJ2/KQTlWnEihr6UaqcipVoSmp/fBdZ2
         zf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vlieLBRBUVyp74ZXuf3VA2mlBE47lQESjmpcCr1ryl4=;
        b=hfRa8D3G3YHDE04LjXXdB7V/NO9fZcvvas/TmWo6vmzDqwoLm6bcLc2ML7A/jU4+Wg
         TMRPfcSpwCAJTmr7kqhoK37R+YBXQX9vinFd2/DEt4Rl4s9psrwIfKNeaKeTM4+xvVyL
         X6qHAvDUBMjXUEc38iv7dVNB8CN7MFxAkUUv9tMdZVID9gc3By1SditF0FviRVbZ56y6
         QjL1jgZKdDwLASb3+o/eCMGbs8UEs8d1EsjG4BNqqvEPBTR4kwNnryTcyJQJn8gDIWfg
         XdjKNirUKbm3q2+PmO7Yz45aWhsWI1yre+aScm/2CRKZ48dTFZ7UVMqpVXjhRox4mvJ9
         09Gw==
X-Gm-Message-State: APjAAAUO1RO/IM6mqXaNH7sN3jHTgg6yKwWSDa+pTHWO62UhL4rSQ7nj
        hU9/SSGG5H3a6WVC6em1klI=
X-Google-Smtp-Source: APXvYqxQiDbtDbQHek0wgvNilEtNxd9130ZAnvnW9Pl7Aj3tfmf3Akrxa66xRmyZMoRe4X0P7HBbuQ==
X-Received: by 2002:a2e:9890:: with SMTP id b16mr2964327ljj.190.1576693438965;
        Wed, 18 Dec 2019 10:23:58 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id s7sm1588154ljo.43.2019.12.18.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:23:58 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v4 0/4] Minor cleanup of tegra-apbmisc.c
Date:   Wed, 18 Dec 2019 21:23:00 +0300
Message-Id: <20191218182304.21956-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

There are couple things could be improved in tegra-apbmisc.c and this
patchset addresses them. Please note that the fallback for older device
trees was broken for T124 since 2015, so it is also a minor change.

Changelog:

v4: - Rebased on recent linux-next which got this change 1188dd7d3fbd.

v3: - Michał Mirosław suggested to unmap APB MISC registers after they
      are not needed anymore. There is now a new patch which does that,
      see patch "Unmap registers once they are not needed anymore".

v2: - Corrected commit's title of the "Warn if straps are not ready" patch.

Dmitry Osipenko (4):
  soc/tegra: fuse: Cache values of straps and Chip ID registers
  soc/tegra: fuse: Warn if straps are not ready
  soc/tegra: fuse: Correct straps' address for older Tegra124 device
    trees
  soc/tegra: fuse: Unmap registers once they are not needed anymore

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 33 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

-- 
2.24.0

