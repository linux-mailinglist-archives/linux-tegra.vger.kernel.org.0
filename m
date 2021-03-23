Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F2034645A
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Mar 2021 17:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhCWQFV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Mar 2021 12:05:21 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:22069 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbhCWQEt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 12:04:49 -0400
Date:   Tue, 23 Mar 2021 16:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1616515487;
        bh=ao9KQDzsVqgk8WazG/XoLS+MV25cCULLmwp/C3GPD+U=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=K/+BqLOU3o/qmwr88rIuaR7JGgM3+1Nc1Xptp8b5mLR39a1baNskPMMIyPOHn9up7
         I9aq+q1zhVqZmASTAfGKwzF8Vo7OSItKkbDSJnfVeOC+kuBRQuBVe2unCLl9xcm8Ly
         IA6ZWgZOOGTaU6x+gN8c4LKiaPLx6Txkjt4G2HSMFb63b1PRCpfa+pIFtvmcWsJjvK
         Ze2we/id4LuyFyNNlT6YAqbrt9Sm9hJV0umCc4sn0C6GJn46tZQLahK1/LDVBaA9rF
         HM9CHJbEV5Vz6zjOm1giv7Tz+rZ0Y88eZ2ACslnkpg7ayWvqxFrwKVUPUKVYlGMk3i
         H2TMDHTIVjkhw==
To:     Thierry Reding <thierry.reding@gmail.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/9] drm/fourcc: Add macro to check for the modifier vendor
Message-ID: <cEyRtluqBdulJxqLBLGpza4_rFKfTtmboo04l2mUFzjOcxGcILAbxPsLVmqQrMrAC0--VT7V_9rgVtvgbW3jLejGf-V8gpnMO10QHK9GtSQ=@emersion.fr>
In-Reply-To: <20210323155437.513497-2-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com> <20210323155437.513497-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Can we instead have a macro/function to get the vendor? This would be
useful elsewhere as well, see drmGetFormatModifierVendor in a recent-ish
libdrm patch [1].

[1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/108/diffs#91e=
cb12b27c7154b26013bb95e17a5cc24ea443e_947_947
