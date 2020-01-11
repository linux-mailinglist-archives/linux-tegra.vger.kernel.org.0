Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 856DC137AA3
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbgAKAgB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:01 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38649 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbgAKAgA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:00 -0500
Received: by mail-wm1-f67.google.com with SMTP id u2so3799752wmc.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=upPg1VmV9Btab+DMy1GA5Ke0vGa3h3LTB+SNHHceH3U=;
        b=n3H3cEqp5zg3m/V+EhIx/4SCvJ4yV3nCl4cXoBxUYkxgcH2laseQzd0Xw72Ube1pIv
         IIDyXhz2vRSFhSOyGlsN2xyVdiVL6PtXWwDl+oa9M0550SXdNCChm6tSUsqrkBv73O4J
         3dwuUT1weou+LteoBTJvxyf+9Mi4ykuJB0f/RSIEFYiqLTtnwGP/IPMDMDwRQQmLgggN
         FE926vEqSX9y4nyzcNX/HKF4ZSeoeG0Ulo6ov6WMIM1qEBpyeH5zXImwBzAjHd8wQ+Eu
         D0McL/Rh+jucddqlpmGm4LZ8kKD3CV7sSjw7r1lJTQshuJA9QdodDam8SYH4azmPwjIt
         RkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=upPg1VmV9Btab+DMy1GA5Ke0vGa3h3LTB+SNHHceH3U=;
        b=rnzE28wki2QDIsAb79EbV62asfHwb5GgQjcLDVwJhFLN3J7sOk5yW5P4hk17D/gjes
         y9O9PdF7crwgk6C1HYrkXd+0YbqnWlLp0Bx285svT33VfCgAx/qwb7Jj6ugKwOx3yabf
         w7y46/V97g0R/qEQzrDQ6rItlfpeIZEW9Cep738+6DDlBEbGqR1GFMM7EElF0E3lGcuJ
         BP+wE2IKCg7uYgafVHzjIWEfTQTDuIN4sZa+mJcSVOQSqr5MrGJZBxPp2aBGkV7CRFQx
         84180QPNgLh8doSh5AzvKf/e6VKH/LSBV6jhnPJ5GU/lnsjGNrxfl7uuDsbO4Hwb9UqS
         7Biw==
X-Gm-Message-State: APjAAAUjKEidKlE5MNx/sY3HzX+XIZ4Ec/tZVqY2EjwFeIQN0kEnt1k7
        lRlBcMim2/P33C45hu8+fvs=
X-Google-Smtp-Source: APXvYqwkIjqCN49vn+eV3kVECprsvX9UkysvqnA2xGcX8uUwiUx3fUsyce6AV3TkoFdmSeMAcxy9mg==
X-Received: by 2002:a1c:23d7:: with SMTP id j206mr6687362wmj.39.1578702958673;
        Fri, 10 Jan 2020 16:35:58 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id v17sm4053740wrt.91.2020.01.10.16.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:35:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] dt-bindings: Changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:46 +0100
Message-Id: <20200111003553.2411874-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-dt-bindings

for you to fetch changes up to 720ad00eade9d08aabaf7b130fed1817252badf5:

  dt-bindings: memory: Add Tegra186 memory subsystem (2020-01-09 19:11:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.6-rc1

This contains a conversion of the Tegra124 EMC bindings to json-schema
as well as the addition of the bindings for the memory subsystem found
on Tegra186 and Tegra194.

----------------------------------------------------------------
Thierry Reding (4):
      dt-bindings: memory-controller: Convert Tegra124 EMC to json-schema
      dt-bindings: memory: Add Tegra186 memory client IDs
      dt-bindings: memory: Add Tegra194 memory controller header
      dt-bindings: memory: Add Tegra186 memory subsystem

 .../memory-controllers/nvidia,tegra124-emc.txt     | 374 ---------------
 .../memory-controllers/nvidia,tegra124-emc.yaml    | 528 +++++++++++++++++++++
 .../memory-controllers/nvidia,tegra186-mc.yaml     | 130 +++++
 include/dt-bindings/memory/tegra186-mc.h           | 139 ++++++
 include/dt-bindings/memory/tegra194-mc.h           | 410 ++++++++++++++++
 5 files changed, 1207 insertions(+), 374 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
 create mode 100644 include/dt-bindings/memory/tegra194-mc.h
