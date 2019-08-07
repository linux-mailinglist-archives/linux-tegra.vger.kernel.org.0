Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E027A84E2A
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Aug 2019 16:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbfHGOGi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Aug 2019 10:06:38 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40008 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbfHGOGi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Aug 2019 10:06:38 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so86351496eds.7
        for <linux-tegra@vger.kernel.org>; Wed, 07 Aug 2019 07:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJhh4xV0LSLkw0VOcj3qALl+bM7Er5DzqLmgnQpAsmA=;
        b=Fj8c+dEn6FA8oZt2dkPXtmCkSgQup71CCK6a6tZ6+higq4BxlUuBlP/OtrrQlhzPUT
         8AySRSuJwW/0Fa7n2ivuLrbNlQIh3LmSRgf3Hjicuprnny/eNZSWBibwE725kaKeckzz
         QpjH1dWcpTbcCGWnyfmZGJ476eVz7raHofAah48ksC/gjjWBokoH7YKyo5u50fS9LeHF
         8Xukg1C2MoJ+jIsTAhOOEX/gjhPVYZzu63rcgIxOoJLcN3m9jdWrMQ/acnfTEpsm3BUR
         GQZLefwSFmBZbOmysiLnuP73bxEZjDd0ITdcuCLZvIwa6+gxdwGII8UhYFAMq79aknwM
         M2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJhh4xV0LSLkw0VOcj3qALl+bM7Er5DzqLmgnQpAsmA=;
        b=EITxeS7NSL2tLAkbYcnQkY2bzhTiK6Wb4TXCeDBWWJMNQe5MZn7fCf311UsDBvuHaC
         jfIm5UrnfoerSuviW1bnLG0Fmy8eFCoy8NE5y49UmlYxnutMShI8g02VPBWjCqRhF1ty
         vXi6szHEEZeByymQcmABV0ME5dzdHUCnrT58bsnh77ywhYxOkZF84X/8Nbg4xEnk3eIr
         Jy9cSDK7UQ56QG6jmVDTvkAp2+/k4mTe8PKhXZG+z6WbplTdhz6EAq+bkMAAX4TBU2d0
         T4bDqAxmruwbzudp4x3fRxGYQO2VDhJ+UwJkOvpG/woosGqI0Rp6/ToN+YZ0TV4672Pf
         nrkg==
X-Gm-Message-State: APjAAAWekEVVHxxfqcSPRk2ZozDGAgOtmXyXOxyjwfFTUPXM0iTQF6RC
        x/kza1ejrkPQwYJNaPu+U0o=
X-Google-Smtp-Source: APXvYqyYEbeJQV45sGrhFq0CQEgjohTkLpK6t2CydZYiJsi3XjfiVRgA2KC3bE+0lGzNmMhNSUD99g==
X-Received: by 2002:a50:8be8:: with SMTP id n37mr9903612edn.216.1565186796416;
        Wed, 07 Aug 2019 07:06:36 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id o18sm20760309edq.18.2019.08.07.07.06.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 07:06:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.3-rc4
Date:   Wed,  7 Aug 2019 16:06:34 +0200
Message-Id: <20190807140634.29166-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.3-rc4

for you to fetch changes up to 2a6fc3cb5cb68597f1072bfeef28d2ca02310220:

  drm/tegra: Fix gpiod_get_from_of_node() regression (2019-07-25 15:23:26 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.3-rc4

This contains a single fix for a regression introduced by a combination
of a GPIO and a drm/tegra patch merged in v5.3-rc1.

----------------------------------------------------------------
Dmitry Osipenko (1):
      drm/tegra: Fix gpiod_get_from_of_node() regression

 drivers/gpu/drm/tegra/output.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
