Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3FEECF43
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfKBOpi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38705 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfKBOpi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id v9so12460967wrq.5
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+sFGkSU5hfvo4D8WEpa51VLxLij3Lp+HaowAkrxp1ro=;
        b=rl29Ph4qud6uyCcyXTxYAu/hiB9okEPNBlYsJrBkrZpE4RemCfNUNC2TRp4DTDNF0R
         4SWVQrp9+/SiGnkifwdpBxUg069WHmcsZAuWdI1Zpf7Nhl31OydBCbyWb1wCbQ94IMZJ
         NhTlxOUe/CajwtmurKcXSd19KQPkr/lPMjMMBZ8y4RByQBoeOLml/SqzXEWXhTjt2KwI
         AxP6K7fmWU4vxVeQy6rkbpyplc15xB5lQBAEHGph1yYssxgrYJGAcGdhTFXXl89tUivg
         nhJFLQrMdv6eudwSyH89jSYc1GasVSpyDr6rqGAKxsrBWEsqBkP6Bx67mZ1NppDZtaQx
         ISEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+sFGkSU5hfvo4D8WEpa51VLxLij3Lp+HaowAkrxp1ro=;
        b=k+kSvH5IDK1ZN+XauQRGkrdmIZ/eucZ+RDEy+k9c0pLmB3MazpeqaoiGtGWZ7g3rGu
         NmhVXDwqcAtfKrWeg3e/+79OGImSSzzeZbiitOcGU6a5QOo2AX7AlLejWEFZwJBSE+tP
         WQXeqTJQeRmk0DLW1pipLumcTESm/QxfDxI1N99JzFhhmJyEhjiPWdEwrOl9gLF07oyv
         ROtsjypNtp7m0CLsbdiKLOv1cy2+ERDQI1pu+0w0kJ0WivopVLva+JyA3sZYSpaDzaeM
         msOwNITL/UpZDwow3+9xVTexuRRJ7WAq7+O0xfCgyCW3nYpcMm/nxK4X8mo7Z3+skXs5
         Zs7Q==
X-Gm-Message-State: APjAAAU/ZkoCauSmRrVs4dfCjOyttkPQFFjN12SogFgc/ehTXJU4NHft
        JOKzBggqb+mR3p0on1UWtLs=
X-Google-Smtp-Source: APXvYqzhvJd1Y2aYHcUDzBlX0wsJzxhkHNrrh9rVamnR23xGELdkN01ebONy5VyHPUZ8Oe5RRmM85Q==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr14880467wru.4.1572705936521;
        Sat, 02 Nov 2019 07:45:36 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id j22sm15143980wrd.41.2019.11.02.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] ARM: tegra: Default configuration changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:20 +0100
Message-Id: <20191102144521.3863321-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm-defconfig

for you to fetch changes up to 480bb31f4286d838fc0eebcfd813dd83236406e7:

  ARM: tegra: Enable Tegra VDE driver in tegra_defconfig (2019-10-29 14:10:35 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.5-rc1

Enables the Tegra VDE driver by default. This is currently in staging
but can be used with existing userspace to do hardware-accelerated video
decoding of H.264 streams.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra: Enable Tegra VDE driver in tegra_defconfig

 arch/arm/configs/tegra_defconfig | 2 ++
 1 file changed, 2 insertions(+)
