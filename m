Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373A61D5288
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgEOOxS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:17 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CC6C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:17 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id y3so3933082wrt.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SX5Bvwgq1NCpycdgBCR9PBZe8tNMYarBnn+Wo58F7TE=;
        b=ZSpUts1p2V+jm65xGyFdEfdNEm3vqUIjDn0QO3tjKgS7pVp1tsIS5TQWMV2YUO4qyf
         S/N/ColVzKXLowSbNJ/8sAGDDKC8qLcMYbZKCjBucHgC225cPawt/3dNSiqeRPZvK2Oh
         NBL8CcaQWULu7hcL/wjBTeIEpZBvG3njqPMICgvChW+4ZuQD/HfxnzshLyMFHY9G/1m9
         q/qPzwhNruQw3dx3awwob4WAt6648UxmdwLLl4FRyK4V6tRB42c1kCfsMDXBuYgzG6Aw
         STLV5cz1kxuOMU9TBR/nlC88uNYv67ua/ufOIF2g9TvGu4qhSlPKe2R2LS9hb0yKM3Mg
         OVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SX5Bvwgq1NCpycdgBCR9PBZe8tNMYarBnn+Wo58F7TE=;
        b=lyBsmzEZueL6z0580sbsAj7C/zh7qblB/OKup/GNmlxekObt6jKCL2hrWQGPwO/lIU
         btviWLIQLnQhpc4BNAJzAn/2DE/ltNzztMInqtdc/KI6CZU9CzTLLvq6pqB9sEYCHh6+
         3P2bMJKqDdVVtMzrTuNDbPm53zLDlDR0iQQnn89cgtL0cLIfyLINgkr0EvJG5XoLrpgL
         5zOFxPRTAyKzswaTXvWEWkZ0FnSgJUvrVl5dgdBZDdtCfs0CuBjo5mGKfRCwCDAKVfIh
         clLK7Dqkd9JPyzrhnNWRIUuDQukL8bPQTY6tTn15m5ATTMvKbYmNv5Sz2AFDukKuGr2+
         Entg==
X-Gm-Message-State: AOAM533+sO/3KlvlEu2gMKWAk0dbUw9mcNUgo1jClixY36G+1/f5qwuW
        JPN36IyC3TsOXOCVcrpEn0M=
X-Google-Smtp-Source: ABdhPJzgQb+q8i0SHtbCmU9o/4qBh9GOqYxAltQtOQU4/+xzTU8ZChsTImA8UBelmztau/r7CJmOiA==
X-Received: by 2002:adf:9d91:: with SMTP id p17mr4519295wre.119.1589554396003;
        Fri, 15 May 2020 07:53:16 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id l1sm4182436wrc.24.2020.05.15.07.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 00/11] tegra: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:00 +0200
Message-Id: <20200515145311.1580134-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

This set of pull requests contains a couple more driver changes than
usual, which is primarily because of some build-time and runtime
dependencies.

The biggest driver here is probably the VI/CSI driver for Tegra210
which has been extensively been reviewed on the mailing list and was
acked by two of the subsystem maintainers.

Other than that there's CPU frequency scaling work and CPU idle support
for older chips, both of which have also been acked by the corresponding
maintainers. There are also three patches to core OF support which Rob
also acked and which are a build-time dependency for the Tegra210 EMC
frequency scaling patches.

The rest is pretty standard stuff.

For last cycle you had asked subarch maintainers to help with fleshing
out pull request details. Is this something that you wanted to pursue
for this cycle as well?

Thierry
