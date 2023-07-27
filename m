Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A86A76497E
	for <lists+linux-tegra@lfdr.de>; Thu, 27 Jul 2023 09:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbjG0H4a (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 27 Jul 2023 03:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbjG0H4I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jul 2023 03:56:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65615E78;
        Thu, 27 Jul 2023 00:53:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D51114A9;
        Thu, 27 Jul 2023 09:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690444325;
        bh=dR8gnsMmE2P/4PG3z2RpAooK2VdzEXWdnAESzz3tzGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QLceiO/bT7iigaqo5m1H9YfZv1+e+eGHhkelR0EzPuQQH4DPln/NGlcJWK41nFkjV
         tQ4GPtuZI10fJFTSLvcv5WuldHhWmCucBWZbBstN11Y7FGJv/6idM57McyZqK7/YCC
         jgNS2reGm/i2vEYFNZDBYoDOeSYu++veIzZmSZpg=
Date:   Thu, 27 Jul 2023 10:53:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa
 CLAA070WP03XG to LVDS
Message-ID: <20230727075310.GC25174@pendragon.ideasonboard.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

Thank you for the patch.

On Wed, Jul 26, 2023 at 08:50:08PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 344e5df40c2f..dbbf32a8be87 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -40,6 +40,8 @@ properties:
>      items:
>        - enum:
>            - auo,b101ew05
> +          # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
> +          - chunghwa,claa070wp03xg
>            # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
>            - hannstar,hsd101pww2
>            - tbs,a711-panel
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index f4d9da4afefd..67959290b212 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -103,8 +103,6 @@ properties:
>        - cdtech,s070wv95-ct16
>          # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
>        - chefree,ch101olhlwh-002
> -        # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
> -      - chunghwa,claa070wp03xg
>          # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
>        - chunghwa,claa101wa01a
>          # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel

-- 
Regards,

Laurent Pinchart
